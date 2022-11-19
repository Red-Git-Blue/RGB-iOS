//
//  BaseAbstractSearch.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//
import UIKit

public class BaseAbstractSearch: UIViewController {
    
    func viewIndex() -> Int {
        return 0
    }
    
    private var clicked: Int = 0
    
    public override func viewDidLoad() {
        let navbarItem = [
            UIBarButtonItem(title: "코인", style: .plain, target: self, action: #selector(coinTap)),
            UIBarButtonItem(title: "유저", style: .plain, target: self, action: #selector(userTap))
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
        presentView(CoinSearchViewController(), false)
    }
    
    @objc func userTap() {
        presentView(UserSearchViewController(), false)
    }
}

