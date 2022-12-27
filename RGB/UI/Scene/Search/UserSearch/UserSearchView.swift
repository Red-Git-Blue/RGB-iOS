//
//  UserSearchView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit
import RxRelay
import RxSwift
import RxCocoa
import Then
import SnapKit

class UserSearchViewController: BaseAbstractSearch {
    
    let disposeBag = DisposeBag()
    
    private lazy var tableView = UITableView().then {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        let data = Observable<[String]>.just(["서울", "부산", "온수", "건대", "온수", "부천", "송파", "가", "가나", "가나다", "가나다라", "가카타파하", "에이", "a", "ab", "abc", "apple", "mac", "azxy"])
        
        view.backgroundColor = .black
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        data.bind(to: tableView.rx.items(cellIdentifier: SearchTableViewCell.identifier, cellType: SearchTableViewCell.self)) {
            index, item, cell in
            
            cell.attribute()
            cell.layout()
        }
        .disposed(by: disposeBag)
    }
    
    
    
    override func viewIndex() -> Int {
        return 1
    }
    
    func layout() {
        [
            tableView
        ].forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
    }
}


extension UserSearchViewController: UITableViewDelegate {
    
}
