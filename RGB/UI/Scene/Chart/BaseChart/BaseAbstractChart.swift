//
//  BaseAbstractChart.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit

public class BaseAbstractChart: UIViewController {
    
    func viewIndex() -> Int {
        return 0
    }
    
    private var clicked: Int = 0
    
    public override func viewDidLoad() {
        let navbarItem = [
            UIBarButtonItem(title: "코인", style: .plain, target: self, action: #selector(coinTap)),
            UIBarButtonItem(title: "통계", style: .plain, target: self, action: #selector(statsTap)),
            UIBarButtonItem(title: "순위", style: .plain, target: self, action: #selector(rankTap)),
        ]
        
        for i in 0...navbarItem.count - 1 {
            if(i == viewIndex()) {
                navbarItem[i].tintColor = .yellow
                continue
            }
            navbarItem[i].tintColor = .systemGray
        }
        
        self.navigationItem.leftBarButtonItems = navbarItem
    }
    
    @objc func coinTap() {
        presentView(ChartViewController(), false)
    }
    
    @objc func statsTap() {
        presentView(StatsViewController(), false)
    }
    
    @objc func rankTap() {
        presentView(RankViewController(), false)
    }
}
