//
//  RepoSearchPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation

enum SortType: String {
    case stars
    case forks
    case updated
}

class RepoSearchPresenter {
    private let coordinator: RepoCoordinatorInterface?
    private unowned var viewController: RepoSearchViewController
    
    private var items: [Repo] = []
    private var sortType = SortType.updated
    
    public init(coordinator: RepoCoordinatorInterface? = nil, viewController: RepoSearchViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func didLoadView() {
        let service = RepoService()
        viewController.showLoading()
        _ = service.getRepos(query: "dzn", sortType: .updated, success: { (repos) in
            self.viewController.hideLoading()
            
            self.items = repos
            self.viewController.reloadData()
        }, failure: { error in
            self.viewController.hideLoading()
            
            self.viewController.showFailure(error)
        })
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Repo {
        return items[index]
    }
    
    func didSelectSort(type: SortType) {
        self.sortType = type
    }
    
    func didTapSort() {
        viewController.presentSortAlert()
    }
}
