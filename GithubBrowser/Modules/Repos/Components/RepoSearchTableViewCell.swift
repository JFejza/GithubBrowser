//
//  RepoSearchTableViewCell.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 12/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import UIKit
import SDWebImage

class RepoSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var repoLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var watcherLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with item: Repo) {
        authorImageView.sd_setImage(with: item.authorImageUrl)
        repoLabel.text = item.name
        authorLabel.text = item.author
        watcherLabel.text = "Watchers: " + String(item.watcherCount)
        forkLabel.text = "Forks: " + String(item.forkCount)
        issueLabel.text = "Issues: " + String(item.issueCount)
    }

}
