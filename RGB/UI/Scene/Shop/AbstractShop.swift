//
//  AbstractShop.swift
//  RGB
//
//  Created by 박준하 on 2022/11/18.
//

import UIKit

public class AbstractShop: UIViewController {
    
    func viewIndex() -> Int {
        return 0
    }
    
    private var clicked: Int = 0
    
    public override func viewDidLoad() {
        let navbarItem = [
            UIBarButtonItem(title: "메인", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "카테고리", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "목록", style: .plain, target: self, action: nil),
            UIBarButtonItem(title: "잔디", style: .plain, target: self, action: nil)
        ]
        
        for i in 0...navbarItem.count {
            if(i == viewIndex()) {
                navbarItem[i].tintColor = .yellow
                continue
            }
            navbarItem[i].tintColor = .systemGray
            navbarItem[i].action = #selector(nav)
        }
        
        self.navigationItem.leftBarButtonItems = navbarItem
    }
    
    @objc func nav() {
        switch clicked {
        case 0:
            presentView(ShopViewController(), false)
        case 1:
            presentView(CategoryViewController(), false)
        case 2:
            presentView(ListViewController(), false)
        case 3:
            presentView(GrassGatchaViewController(), false)
        default:
            return
        }
    }
}
