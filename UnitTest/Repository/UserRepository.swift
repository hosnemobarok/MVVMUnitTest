//
//  UserRepository.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import Foundation

protocol UserRepository {
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void)
}
