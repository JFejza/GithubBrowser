//
//  RepoMocks.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Alamofire
@testable import GithubBrowser

class RepoServiceMock: RepoServiceInterface {
    func getRepos(params: RepoSearchParams, success: @escaping ([Repo]) -> (), failure: @escaping ((Error) -> ())) -> Request? {
        success([Repo.mock])
        return nil
    }
}

class RepoCoordinatorMock: RepoCoordinatorInterface {
    var navigatedToDetails = false
    var openedExternal = false
    func navigateToDetails(repo: Repo) {
        navigatedToDetails = true
    }
    
    func openExternal(url: URL) {
        openedExternal = true
    }
}


//MARK: Search
class RepoSearchPresenterMock: RepoSearchPresenter {
    var sortFlag = false
    var viewLoadFlag = false
    var askedForItem = false
    
    override func didLoadView() {
        viewLoadFlag = true
    }
    
    override func item(at index: Int) -> Repo {
        askedForItem = true
        return Repo.mock
    }
    
    override func didTapSort() {
        sortFlag = true
    }
    
    override func numberOfItems() -> Int {
        return 5
    }
    
    override func didSelectItem(at index: Int) {
        askedForItem = true
        return
    }
    
}

class RepoSearchViewControllerMock: RepoSearchViewController {
    var sortTriggered = false
    var reloadTriggered = false
    override func presentSortAlert() {
        sortTriggered = true
    }
    
    override func reloadData() {
        reloadTriggered = true
    }
}

//MARK: Details
class RepoDetailsPresenterMock: RepoDetailsPresenter {
    var viewLoadFlag = false
    var authorFlag = false
    var repoFlag = false
    
    override func didLoadView() {
        viewLoadFlag = true
    }
    override func didTapAuthorPage() {
        authorFlag = true
    }
    
    override func didTapRepoPage() {
        repoFlag = true
    }
    
}

class RepoDetailsViewControllerMock: RepoDetailsViewController {
    var setupFlag = false
    
    override func setup(with repo: Repo) {
        setupFlag = true
    }
    
}
