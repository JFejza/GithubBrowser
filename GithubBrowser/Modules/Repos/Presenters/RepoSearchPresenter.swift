//
//  RepoSearchPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation

enum SortType {
    case stars
    case forks
    case updated
}

protocol RepoSearchPresenterInterface {
    unowned var viewController: RepoSearchViewController {get set}
    var numberOfItems: Int {get}
    func item(at index: Int) -> Repo
    func didLoadView()
    func didSelectSortType(type: SortType)
    func didTapSort()
}

class RepoSearchPresenter: RepoSearchPresenterInterface {
    private let coordinator: RepoCoordinatorInterface
    unowned var viewController: RepoSearchViewController
    
    public init(coordinator: RepoCoordinatorInterface, viewController: RepoSearchViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    private var items: [Repo] = []
    private var sortType = SortType.updated
    
    var numberOfItems: Int {
        return items.count
    }
    
    func didLoadView() {
        
    }
    
    func item(at index: Int) -> Repo {
        return items[index]
    }
    
    func didSelectSortType(type: SortType) {
        self.sortType = type
    }
    
    func didTapSort() {
        viewController.presentSortAlert()
    }
}
