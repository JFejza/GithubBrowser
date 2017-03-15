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
import Wrap

protocol RepoServiceInterface {
    func getRepos(params: RepoSearchParams, success: @escaping ([Repo]) -> (), failure: @escaping ((Error) -> ())) -> Request?
}

struct RepoService: RepoServiceInterface {
    
    func getRepos(params: RepoSearchParams, success: @escaping ([Repo]) -> (), failure: @escaping ((Error) -> ())) -> Request? {
        let dict: [String: Any] = try! wrap(params)
        return APIManager().execute(method: .get, route: "repositories", params: dict, success: { (json) in
            
            if let items = json["items"] as? [UnboxableDictionary] {
                do {
                    let repos: [Repo] = try unbox(dictionaries: items)
                    success(repos)
                } catch {
                    failure(error)
                }
            } else {
                failure(UnboxError.invalidData)
            }
            
        }, failure: failure)
    }
}
