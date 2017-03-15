//
//  RepoCoordinator.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit

protocol RepoCoordinatorInterface: ExternalNavigatable {
    func navigateToDetails(repo: Repo)
}

struct RepoCoordinator: CoordinatorInterface, RepoCoordinatorInterface {
    
    let navigationController: UINavigationController
    
    func start() {
        navigationController.pushViewController(getStartViewController(), animated: true)
    }
    
    func navigateToDetails(repo: Repo) {
        navigationController.pushViewController(getDetailsViewController(repo: repo), animated: true)
    }
    
    //MARK: Setup
    func getStartViewController() -> UIViewController {
        let viewController = RepoSearchViewController.from(storyboard: .Repos)
        let presenter = RepoSearchPresenter(coordinator: self, viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    func getDetailsViewController(repo: Repo) -> UIViewController {
        let viewController = RepoDetailsViewController.from(storyboard: .Repos)
        let presenter = RepoDetailsPresenter(coordinator: self, viewController: viewController, repo: repo)
        viewController.presenter = presenter
        return viewController
    }
    
}
