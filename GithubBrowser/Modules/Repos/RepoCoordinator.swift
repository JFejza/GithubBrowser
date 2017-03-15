//
//  RepoCoordinator.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit

protocol RepoCoordinatorInterface: CoordinatorInterface {
    
}

struct RepoCoordinator: RepoCoordinatorInterface {
    
    let navigationController: UINavigationController
    
    func start() -> UIViewController {
        let viewController = RepoSearchViewController.from(storyboard: .Repos)
        let presenter = RepoSearchPresenter(coordinator: self, viewController: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: false)
        return viewController
    }
    
}
