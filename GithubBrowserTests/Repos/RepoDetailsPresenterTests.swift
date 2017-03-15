//
//  RepoDetailsPresenterTests.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
@testable import GithubBrowser

class RepoDetailsPresenterTests: XCTestCase {
    
    var viewController: RepoDetailsViewControllerMock!
    var presenter: RepoDetailsPresenter!
    var coordinator: RepoCoordinatorMock!
    
    override func setUp() {
        super.setUp()
        coordinator = RepoCoordinatorMock()
        viewController = RepoDetailsViewControllerMock()
        presenter = RepoDetailsPresenter(coordinator:coordinator, viewController: viewController, repo: Repo.mock)
    }
    
    override func tearDown() {
        super.tearDown()
        coordinator = nil
        viewController = nil
        presenter = nil
    }
    
    func testSetup() {
        presenter.didLoadView()
        XCTAssertTrue(viewController.setupFlag)
    }
    
    func testAuthorNavigation() {
        presenter.didTapAuthorPage()
        XCTAssertTrue(coordinator.openedExternal)
    }
    
    func testRepoNavigation() {
        presenter.didTapRepoPage()
        XCTAssertTrue(coordinator.openedExternal)
    }
    
}
