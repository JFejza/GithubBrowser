//
//  RepoSearchPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation

class RepoSearchPresenter {
    private let coordinator: RepoCoordinatorInterface
    private unowned var viewController: RepoSearchViewController
    
    public init(coordinator: RepoCoordinatorInterface, viewController: RepoSearchViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
}
