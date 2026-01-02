//
//  UserRepositoryImpl.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//

import Foundation

final class UserRepositoryImpl: UserRepository {    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let urlString = AppConfiguration.apiBaseURL.absoluteString + AppConfiguration.APIEndpoints.users
        let request = APIRequest(urlString: urlString)

        NetworkManager.shared.fetch(request, model: [User].self) { networkResult in
            switch networkResult {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
