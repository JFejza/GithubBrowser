//
//  RepoSearchParams.swift
//  GithubBrowser
//
//  Created by Jeton Fejza on 15/03/2017.
//  Copyright © 2017 Jtronik. All rights reserved.
//

import Wrap

struct RepoSearchParams: WrapCustomizable {
    let query: String
    let sort: SortType
    
    func keyForWrapping(propertyNamed propertyName: String) -> String? {
        if propertyName == "query" {
            return "q"
        }
        return propertyName
    }
    
}
