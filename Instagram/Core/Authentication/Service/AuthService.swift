//
//  AuthService.swift
//  Instagram
//
//  Created by Omkar Anarse on 03/12/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class AuthService {
    
    @Published var userSession : FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email : String, password : String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Error Occured \(error.localizedDescription)")
        }

    }
    
    @MainActor
    func createUser(email : String, password : String, userName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Created new user successfully!")
            await uploadUserData(uid: result.user.uid, username: userName, email: email)
            print("uploaded data successfully!")
        } catch {
            print("Error Occured \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid : String, username : String, email: String) async {
        let user = User(id: uid,userName: username, email: email)
        guard let encoderUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encoderUser)
    }
}
