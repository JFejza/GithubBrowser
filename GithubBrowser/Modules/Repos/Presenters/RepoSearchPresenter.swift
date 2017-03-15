//
//  RepoSearchPresenter.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation
import RxSwift

enum SortType: String {
    case stars
    case forks
    case updated
}

class RepoSearchPresenter {
    private let coordinator: RepoCoordinatorInterface?
    private unowned var viewController: RepoSearchViewController
    
    private var items: [Repo] = []
    
    var sortType = Variable(SortType.updated);
    var query = Variable("")
    let disposeBag = DisposeBag()
    
    public init(coordinator: RepoCoordinatorInterface? = nil, viewController: RepoSearchViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func didLoadView() {
        Observable.combineLatest(query.asObservable(), sortType.asObservable()) { (text, sort) -> Observable<[Repo]> in
            if text.isEmpty {
                return Observable.just([Repo]())
            }
            
            return Observable<[Repo]>.create({ (observer) -> Disposable in
                let service = RepoService()
                let request = service.getRepos(query: text, sortType: sort, success: { (repos) in
                    observer.onNext(repos)
                }, failure: { error in
                    observer.onError(error)
                })
                return Disposables.create {
                    request!.cancel()
                }
            })
            }
            .flatMapLatest( { $0 } )
            .catchErrorJustReturn([])
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (repos) in
                self.items = repos
                self.viewController.reloadData()
            })
            .addDisposableTo(disposeBag)
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Repo {
        return items[index]
    }
    
    func didTapSort() {
        viewController.presentSortAlert()
    }
    
    func didSelectItem(at index: Int) {
        let item = items[index]
        _ = coordinator?.navigateToDetails(repo: item)
    }
}
