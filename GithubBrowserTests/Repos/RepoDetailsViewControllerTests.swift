//
//  RepoDetailsViewControllerTests.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
@testable import GithubBrowser

class RepoDetailsViewControllerTests: XCTestCase {
    
    var viewController: RepoDetailsViewController!
    var presenter: RepoDetailsPresenterMock!
    
    override func setUp() {
        super.setUp()
        viewController = RepoDetailsViewController.from(storyboard: .Repos)
        presenter = RepoDetailsPresenterMock(viewController: viewController, repo: Repo.mock)
        viewController.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
        presenter = nil
    }
    
    func testViewLoad() {
        _ = viewController.view
        XCTAssertTrue(presenter.viewLoadFlag)
    }
    
    func testAuthorTap() {
        _ = viewController.view
        viewController.authorTapped(viewController.authorButton)
        XCTAssertTrue(presenter.authorFlag)
    }
    
    func testRepoTap() {
        _ = viewController.view
        viewController.visitRepositoryTapped(viewController.visitButton)
        XCTAssertTrue(presenter.repoFlag)
    }
}
