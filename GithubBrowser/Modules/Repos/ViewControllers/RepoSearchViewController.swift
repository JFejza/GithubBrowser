//
//  ViewController.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import RxSwift
import RxCocoa

class RepoSearchViewController: UIViewController, CommonViewInterface {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: RepoSearchPresenter!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        searchBar.rx.text.orEmpty
            .throttle(0.3, scheduler: MainScheduler.instance)
            .bindTo(presenter.query).addDisposableTo(disposeBag)
        presenter.didLoadView()
    }

    @IBAction func sortTapped(_ sender: UIBarButtonItem) {
        presenter.didTapSort()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func presentSortAlert() {
        let alert = UIAlertController(title: "Select sort", message: "", preferredStyle: .alert)
        let starsAction = UIAlertAction(title: "Stars", style: .default) { _ in
            self.selectSort(type: .stars)
        }
        let forksAction = UIAlertAction(title: "Forks", style: .default) { _ in
            self.selectSort(type: .forks)
        }
        let updatedAction = UIAlertAction(title: "Updated", style: .default) { _ in
            self.selectSort(type: .updated)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(starsAction)
        alert.addAction(forksAction)
        alert.addAction(updatedAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    
    }
    func selectSort(type: SortType) {
        presenter.sortType.value = type
    }

}

extension RepoSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoSearchTableViewCell = tableView.dequeueReusableCell()
        let item = presenter.item(at: indexPath.row)
        cell.setup(with: item)
        return cell
    }
}

extension RepoSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath.row)
    }
}

extension RepoSearchViewController: DZNEmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "No results currently available")
    }
    
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
        return presenter.numberOfItems() == 0
    }
    
}

//MARK: Keyboard convenience
extension RepoSearchViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
}

