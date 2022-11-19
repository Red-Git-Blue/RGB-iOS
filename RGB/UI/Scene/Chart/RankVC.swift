//
//  RankVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit

class RankViewController: BaseAbstractChart {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
    }
    
    override func viewIndex() -> Int {
        return 2
    }
}
