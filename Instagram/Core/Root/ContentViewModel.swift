//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Omkar Anarse on 03/12/23.
//

import Foundation
import FirebaseAuth
import Combine


class ContentViewModel : ObservableObject {
    
    private let service = AuthService.shared
    private var canceellables = Set<AnyCancellable>()
    
    @Published var userSession : FirebaseAuth.User?
    
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &canceellables)
    }
}
