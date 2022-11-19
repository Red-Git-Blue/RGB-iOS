//
//  UserSearchView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit

class UserSearchViewController: BaseAbstractSearch {
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }
    
    override func viewIndex() -> Int {
        return 1
    }
}
