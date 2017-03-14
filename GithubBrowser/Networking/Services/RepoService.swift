//
//  File.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 14/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

struct RepoService {
    
    func getRepos(query: String, sortType: SortType, success: @escaping ([Repo]) -> (), failure: @escaping ((String) -> ())) -> Request? {
        return APIManager().execute(method: .get, route: "repositories", params: ["q": query], success: { (json) in
            let items = json["items"]
            let repos: [Repo] = try! unbox(dictionaries: items as! [UnboxableDictionary])
            success(repos)
        }, failure: failure)
    }
}
