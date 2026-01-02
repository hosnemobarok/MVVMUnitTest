//
//  UsersCoordinator.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//


import UIKit

final class UsersCoordinator: Coordinator {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = UserListViewModel()
        let vc = UserListViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: false)
    }
}
