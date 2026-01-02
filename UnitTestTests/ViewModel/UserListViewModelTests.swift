//
//  UserListViewModelTests.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import XCTest
import Combine
@testable import UnitTest

final class UserListViewModelTests: XCTestCase {

    private var viewModel: UserListViewModel!
    private var mockRepository: MockUserRepository!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
        viewModel = UserListViewModel(repository: mockRepository)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        cancellables = nil
        super.tearDown()
    }

    func testLoadUsersSuccess() {
        // Given
        let user = User(id: 1,
                        name: "Leanne Graham",
                        username: "Bret",
                        email: "Sincere@april.biz",
                        address: Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874"),
                        phone: "1-770-736-8031 x56442",
                        website: "hildegard.org",
                        company: Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"))
        mockRepository.usersToReturn = [user]

        let expectation = XCTestExpectation(description: "Users loaded")

        // When
        viewModel.$users
            .dropFirst()
            .sink { users in
                // Then
                XCTAssertEqual(users.count, 1)
                XCTAssertEqual(users.first?.name, "Leanne Graham")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.loadUsers()
        wait(for: [expectation], timeout: 1.0)
    }

    func testLoadUsersFailure() {
        // Given
        mockRepository.errorToReturn = .offline

        let expectation = XCTestExpectation(description: "Error received")

        // When
        viewModel.$errorMessage
            .dropFirst()
            .sink { error in
                // Then
                XCTAssertEqual(error, NetworkError.offline.localizedDescription)
                XCTAssertTrue(self.viewModel.users.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.loadUsers()
        wait(for: [expectation], timeout: 1.0)
    }
}
