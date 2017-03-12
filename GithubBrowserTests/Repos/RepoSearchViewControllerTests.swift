//
//  GithubBrowserTests.swift
//  GithubBrowserTests
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
@testable import GithubBrowser

class RepoSearchPresenterMock: RepoSearchPresenterInterface {
    unowned var viewController: RepoSearchViewController
    init(viewController: RepoSearchViewController) {
        self.viewController = viewController
    }
    
    var viewCreatedFlag = false
    func viewCreated() {
        viewCreatedFlag = true
    }
    
    var numberOfItems = 5
}

class RepoSearchViewControllerTests: XCTestCase {
    
    var viewController: RepoSearchViewController!
    var presenter: RepoSearchPresenterMock!
    
    override func setUp() {
        super.setUp()
        viewController = RepoSearchViewController.from(storyboard: .Repos)
        presenter = RepoSearchPresenterMock(viewController: viewController)
        viewController.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
        presenter = nil
    }
    
    func testViewDidLoad() {
        _ = viewController.view
        XCTAssertTrue(presenter.viewCreatedFlag)
    }
    
    func testNumberOfRows() {
        _ = viewController.view
        let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rows, presenter.numberOfItems)
    }
    
    func testCellReturn() {
        _ = viewController.view
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is RepoSearchTableViewCell)
    }
    
}
