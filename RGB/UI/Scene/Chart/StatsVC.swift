//
//  statsVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit

class StatsViewController: BaseAbstractChart {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
    }
    
    override func viewIndex() -> Int {
        return 1
    }
}
