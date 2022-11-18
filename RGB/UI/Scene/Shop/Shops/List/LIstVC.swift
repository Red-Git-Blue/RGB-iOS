//
//  LIstVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/18.
//

import UIKit

class ListViewController: AbstractShop {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewIndex() -> Int {
        return 2
    }
}
