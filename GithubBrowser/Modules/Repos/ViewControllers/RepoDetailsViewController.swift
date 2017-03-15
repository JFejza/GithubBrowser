//
//  RepoDetailsViewController.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit
import SDWebImage

class RepoDetailsViewController: UIViewController {
    
    @IBOutlet weak var watcherLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var authorButton: UIButton!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var visitButton: UIButton!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    var presenter: RepoDetailsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoadView()
    }
    
    @IBAction func authorTapped(_ sender: UIButton) {
        presenter.didTapAuthorPage()
    }
    
    @IBAction func visitRepositoryTapped(_ sender: UIButton) {
        presenter.didTapRepoPage()
    }
    
    func setup(with repo: Repo) {
        authorImageView.sd_setImage(with: repo.authorImageUrl)
        title = repo.name
        authorLabel.text = repo.author
        watcherLabel.text = "Watchers: " + String(repo.watcherCount)
        forkLabel.text = "Forks: " + String(repo.forkCount)
        issueLabel.text = "Issues: " + String(repo.issueCount)
        aboutLabel.text = repo.desc ?? "No description is available for this repository."
        languageLabel.text = repo.languageName ?? "Unknown"
        createdLabel.text = Repo.uiDateFormatter.string(from: repo.dateCreated)
        updatedLabel.text = Repo.uiDateFormatter.string(from: repo.dateChanged)
    }

}
