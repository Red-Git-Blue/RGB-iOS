//
//  AbstractShop.swift
//  RGB
//
//  Created by 박준하 on 2022/11/18.
//

import UIKit

public class BaseAbstractShop: UIViewController {
    
    func viewIndex() -> Int {
        return 0
    }
    
    private var clicked: Int = 0
    
    public override func viewDidLoad() {
        let navbarItem = [
            UIBarButtonItem(title: "메인", style: .plain, target: self, action: #selector(shopTap)),
            UIBarButtonItem(title: "카테고리", style: .plain, target: self, action: #selector(categoryTap)),
            UIBarButtonItem(title: "목록", style: .plain, target: self, action: #selector(ListTap)),
            UIBarButtonItem(title: "잔디", style: .plain, target: self, action: #selector(grassGatchaTap))
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
    
    @objc func shopTap() {
        presentView(ShopViewController(), false)
    }
    
    @objc func categoryTap() {
        presentView(CategoryViewController(), false)
    }
    
    @objc func ListTap() {
        presentView(ListViewController(), false)
    }
    
    @objc func grassGatchaTap() {
        presentView(GrassGatchaViewController(), false)
    }
}
