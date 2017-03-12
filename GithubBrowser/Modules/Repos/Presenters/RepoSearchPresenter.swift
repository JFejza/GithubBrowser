//
//  RepoSearchPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation

protocol RepoSearchPresenterInterface {
    unowned var viewController: RepoSearchViewController {get set}
    var numberOfItems: Int {get set}
    func viewCreated()
}

class RepoSearchPresenter: RepoSearchPresenterInterface {
    private let coordinator: RepoCoordinatorInterface
    unowned var viewController: RepoSearchViewController
    
    public init(coordinator: RepoCoordinatorInterface, viewController: RepoSearchViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    private var items
    var numberOfItems = 0
    
    func viewCreated() {
        
    }
}
