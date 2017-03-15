//
//  Repo.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 13/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation
import Unbox

struct Repo {
    let name: String
    let author: String
    let authorImageUrl: URL
    let watcherCount: Int
    let forkCount: Int
    let issueCount: Int
    let desc: String?
    let languageName: String?
    let starCount: Int
    let dateCreated: Date
    let dateChanged: Date
    let repoPage: URL
    let authorPageUrl: URL
}

extension Repo: Unboxable {
    init(unboxer: Unboxer) throws {
        self.name = try unboxer.unbox(key: "name")
        self.author = try unboxer.unbox(keyPath: "owner.login")
        self.authorImageUrl = try unboxer.unbox(keyPath: "owner.avatar_url")
        self.watcherCount = try unboxer.unbox(key: "watchers_count")
        self.forkCount = try unboxer.unbox(key: "forks_count")
        self.issueCount = try unboxer.unbox(key: "open_issues_count")
        self.desc = unboxer.unbox(key: "description")
        self.languageName = unboxer.unbox(key: "language")
        self.starCount = try unboxer.unbox(key: "stargazers_count")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.dateCreated = try unboxer.unbox(key: "created_at", formatter: dateFormatter)
        self.dateChanged = try unboxer.unbox(key: "updated_at", formatter: dateFormatter)
        self.repoPage = try unboxer.unbox(key: "html_url")
        self.authorPageUrl = try unboxer.unbox(keyPath: "owner.url")
    }
}
