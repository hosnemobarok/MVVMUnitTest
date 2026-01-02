//
//  AppCoordinator.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        let newsCoordinator = UsersCoordinator(navigationController: navigationController)
        childCoordinators.append(newsCoordinator)
        newsCoordinator.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
