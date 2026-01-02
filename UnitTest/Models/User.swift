//
//  User.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//

import UIKit

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
