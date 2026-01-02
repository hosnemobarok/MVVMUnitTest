//
//  MockUserRepository.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import Foundation
@testable import UnitTest

final class MockUserRepository: UserRepository {

    var usersToReturn: [User] = []
    var errorToReturn: NetworkError?

    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        if let error = errorToReturn {
            completion(.failure(error))
        } else {
            completion(.success(usersToReturn))
        }
    }
}
