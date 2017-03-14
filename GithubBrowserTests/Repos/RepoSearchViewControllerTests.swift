//
//  GithubBrowserTests.swift
//  GithubBrowserTests
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
@testable import GithubBrowser

class RepoSearchPresenterMock: RepoSearchPresenter {
    var viewCreatedFlag = false
    var sortFlag = false
    var type = SortType.updated
    
    override func didSelectSort(type: SortType) {
        self.type = type
    }
    
    override func didLoadView() {
        viewCreatedFlag = true
    }
    
    override func item(at index: Int) -> Repo {
        return Repo(name: "Testme", author: "", authorImageUrl: URL(string: "http://www.google.com")!, watcherCount: 0, forkCount: 0, issueCount: 0, desc: "", languageName: "", starCount: 0, dateCreated: Date(), dateChanged: Date())
    }
    
    override func didTapSort() {
        sortFlag = true
    }
    
    override func numberOfItems() -> Int {
        return 5
    }
    
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
        XCTAssertEqual(presenter.type, .stars)
    }
    
}
