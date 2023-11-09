//
//  Models.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct User: Codable {
    var data: UserInfomation
    var support: Support
}

struct UserInfomation: Codable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct Support: Codable {
    var url: String
    var text: String
}
