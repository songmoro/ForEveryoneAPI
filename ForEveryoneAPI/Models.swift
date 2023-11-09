//
//  Models.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI

struct Users: Codable {
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [UserInfomation]
    var support: Support
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
        case support
    }
}

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

struct Person: Codable {
    var name: String
    var job: String
}

struct Account: Codable {
    var email: String
    var password: String
}
