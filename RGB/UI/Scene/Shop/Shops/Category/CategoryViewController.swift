//
//  CategoryView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/18.
//

import UIKit

class CategoryViewController: AbstractShop {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    override func viewIndex() -> Int {
        return 1
    }
}
