//
//  RepoDetailsPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation

class RepoDetailsPresenter {
    private let coordinator: RepoCoordinatorInterface?
    private unowned var viewController: RepoDetailsViewController
    
    private var repo: Repo
    
    public init(coordinator: RepoCoordinatorInterface? = nil, viewController: RepoDetailsViewController, repo: Repo) {
        self.coordinator = coordinator
        self.viewController = viewController
        self.repo = repo
    }
    
    func didLoadView() {
        viewController.setup(with: repo)
    }
    
    func didTapAuthorPage() {
        coordinator?.openExternal(url: repo.authorPageUrl)
    }
    
    func didTapRepoPage() {
        coordinator?.openExternal(url: repo.repoPageUrl)
    }
}
