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
    let repoPageUrl: URL
    let authorPageUrl: URL
    
    static var unboxDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return df
    }()
    
    static var uiDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm"
        return df
    }()
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
        
        self.dateCreated = try unboxer.unbox(key: "created_at", formatter: Repo.unboxDateFormatter)
        self.dateChanged = try unboxer.unbox(key: "updated_at", formatter: Repo.unboxDateFormatter)
        self.repoPageUrl = try unboxer.unbox(key: "html_url")
        self.authorPageUrl = try unboxer.unbox(keyPath: "owner.html_url")
    }
}

extension Repo: Mockable {
    static var mock: Repo {
        return Repo(name: "Test",
                    author: "Author",
                    authorImageUrl: URL(string: "https://developer.apple.com/swift/images/swift-og.png")!,
                    watcherCount: 1,
                    forkCount: 2,
                    issueCount: 3,
                    desc: "Desc",
                    languageName: "Swift",
                    starCount: 4,
                    dateCreated: Date(),
                    dateChanged: Date(),
                    repoPageUrl: URL(string: "http://www.google.com")!,
                    authorPageUrl: URL(string: "http://www.google.com")!)
    }
}
