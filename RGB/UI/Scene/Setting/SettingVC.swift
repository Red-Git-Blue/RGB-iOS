//
//  SettingVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/17.
//

import UIKit
import Then
import SnapKit

final class SettingViewController: UIViewController  {
    
    private lazy var tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "settingListCell")
        $0.register(ChangeThemeCell.self, forCellReuseIdentifier: "changeThemeCell")
        $0.register(NotificationSettingsCell.self, forCellReuseIdentifier: "notificationSttingsCell")
        $0.register(ChangeLanguageCell.self, forCellReuseIdentifier: "changeLanguageCell")
        $0.register(AccountSettingCell.self, forCellReuseIdentifier: "accountSttingCell")
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "설정"
        
        view.backgroundColor = .systemBackground
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0))
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexPathRow = indexPath.row
        switch indexPathRow {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "changeThemeCell") as! ChangeThemeCell
            cell.setup()
            cell.layer.cornerRadius = 20
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layoutMarginsDidChange()
            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 20.0, left: 0.0, bottom: 20.0, right: 0.0))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "notificationSttingsCell") as! NotificationSettingsCell
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            cell.frame = cell.frame.inset(by: UIEdgeInsets(top: 20.0, left: 0.0, bottom: 20.0, right: 0.0))
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "changeLanguageCell") as! ChangeLanguageCell
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            cell.layoutMargins.bottom = 5
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "accountSttingCell") as! AccountSettingCell
            cell.layer.cornerRadius = 20
            cell.backgroundColor = UIColor(named: "TableViewColor")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if(indexPath.row == 0) {
            self.navigationController?.pushViewController(ThemeViewController(), animated: true)
            print("안녕")
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension SettingViewController {
    func setup() {
        [
            tableView
        ].forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
