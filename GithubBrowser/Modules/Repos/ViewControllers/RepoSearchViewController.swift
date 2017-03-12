//
//  ViewController.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 10/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class RepoSearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RepoSearchPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewCreated()
    }


}

extension RepoSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoSearchTableViewCell = tableView.dequeueReusableCell()
        return cell
    }
}

extension RepoSearchViewController: UITableViewDelegate {
    
}

extension RepoSearchViewController: DZNEmptyDataSetSource {
    
}

extension RepoSearchViewController: DZNEmptyDataSetDelegate {
    
}

