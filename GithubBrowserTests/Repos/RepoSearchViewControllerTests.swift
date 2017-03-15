//
//  GithubBrowserTests.swift
//  GithubBrowserTests
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
import RxSwift
@testable import GithubBrowser

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
    
    func testViewLoad() {
        _ = viewController.view
        XCTAssertTrue(presenter.viewLoadFlag)
    }
    
    func testNumberOfRows() {
        _ = viewController.view
        let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rows, presenter.numberOfItems())
    }
    
    func testCellSetup() {
        _ = viewController.view
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! RepoSearchTableViewCell
        XCTAssertEqual(cell.repoLabel.text, presenter.item(at: 0).name)
    }
    
    func testSortTap() {
        _ = viewController.view
        viewController.sortTapped(viewController.sortBarButtonItem)
        XCTAssertTrue(presenter.sortFlag)
    }
    
    func testSortSelect() {
        _ = viewController.view
        viewController.selectSort(type: .stars)
        XCTAssertEqual(presenter.sortType.value, .stars)
    }
    
    func testCellTap() {
        _ = viewController.view
        viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(presenter.askedForItem)
    }
    
}
