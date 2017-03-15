//
//  RepoSearchPresenterTests.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import XCTest
@testable import GithubBrowser

class RepoSearchPresenterTests: XCTestCase {
    
    var viewController: RepoSearchViewControllerMock!
    var presenter: RepoSearchPresenter!
    var coordinator: RepoCoordinatorMock!
    
    override func setUp() {
        super.setUp()
        coordinator = RepoCoordinatorMock()
        viewController = RepoSearchViewControllerMock()
        presenter = RepoSearchPresenter(coordinator:coordinator, viewController: viewController)
        presenter.service = RepoServiceMock()
    }
    
    override func tearDown() {
        super.tearDown()
        coordinator = nil
        viewController = nil
        presenter = nil
    }
    
    func testSortTriggersAlert() {
        presenter.didTapSort()
        XCTAssertTrue(viewController.sortTriggered)
    }
    
    func testRepoNavigation() {
        presenter.items = [Repo.mock]
        presenter.didSelectItem(at: 0)
        XCTAssertTrue(coordinator.navigatedToDetails)
    }
    
    func testViewLoadTriggersSignals() {
        presenter.didLoadView()
        XCTAssertTrue(viewController.reloadTriggered)
    }
    
}
