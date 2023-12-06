//
//  Post.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import Foundation

struct Post : Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption : String
    var likes : Int
    let imageUrl : String
    let timeStamp : Date
    var user : User?
}

extension Post {
    static var MOCK_POST : [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the caption for the image1!", likes: 103, imageUrl: "Star", timeStamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the caption for the image2!", likes: 103, imageUrl: "captain", timeStamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the caption for the image3!", likes: 103, imageUrl: "iron22", timeStamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the caption for the image4!", likes: 103, imageUrl: "iron", timeStamp: Date(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the caption for the image5!", likes: 103, imageUrl: "imagee", timeStamp: Date(), user: User.MOCK_USERS[4]),
    ]
}
