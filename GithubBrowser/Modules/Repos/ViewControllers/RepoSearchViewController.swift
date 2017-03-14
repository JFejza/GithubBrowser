//
//  ViewController.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class RepoSearchViewController: UIViewController, CommonViewInterface {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortBarButtonItem: UIBarButtonItem!
    
    var presenter: RepoSearchPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        self.presenter.didSelectSort(type: type)
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
    
}

extension RepoSearchViewController: DZNEmptyDataSetSource {
    
}

extension RepoSearchViewController: DZNEmptyDataSetDelegate {
    
}

