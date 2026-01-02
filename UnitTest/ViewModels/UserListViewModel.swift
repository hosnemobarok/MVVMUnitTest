//
//  UserListViewModel.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import Foundation
import Combine

final class UserListViewModel {

    @Published private(set) var users: [User] = []
    @Published private(set) var errorMessage: String?

    private let repository: UserRepository
    private var cancellables = Set<AnyCancellable>()

    init(repository: UserRepository = UserRepositoryImpl()) {
        self.repository = repository
    }

    func loadUsers() {
        repository.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.errorMessage = nil
                    Logger.log("Fetched \(users.count) users successfully.")
                case .failure(let error):
                    self?.users = []
                    self?.errorMessage = error.localizedDescription
                    Logger.log("Failed to fetch users: \(error.localizedDescription)")
                }
            }
        }
    }
}
