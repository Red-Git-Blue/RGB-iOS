//
//  ThemeVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/17.
//

import UIKit
import SnapKit
import Then

class ThemeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "테마 변경"
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableViewButtons.frame = tableViewButtons.frame.inset(by: UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0))
    }
    
    private lazy var themeView = UIView().then {
        $0.backgroundColor = UIColor(named: "TableViewColor")
        $0.layer.cornerRadius = 20
    }
    
    private lazy var themeMainFrameView = UIView().then {
        $0.backgroundColor = UIColor(named: "CollectionViewColor")
        $0.layer.cornerRadius = 20
    }
    
    private lazy var themeSubFrameView1 = UIView().then {
        $0.backgroundColor = UIColor(named: "333333")
        $0.layer.cornerRadius = 10
    }
    
    private lazy var themeSubFrameView2 = UIView().then {
        $0.backgroundColor = UIColor(named: "333333")
        $0.layer.cornerRadius = 20
    }
    
    private lazy var themeSubFrameView3 = UIView().then {
        $0.backgroundColor = UIColor(named: "333333")
        $0.layer.cornerRadius = 10
    }
    
    private lazy var themeSubFrameView4 = UIView().then {
        $0.backgroundColor = UIColor(named: "333333")
        $0.layer.cornerRadius = 10
    }
    
    private lazy var tableViewButtons = UITableView().then {
        $0.register(ThemeListCell.self, forCellReuseIdentifier: "BlackMode")
        $0.register(ThemeListCell.self, forCellReuseIdentifier: "WhiteMode")
        $0.register(ThemeListCell.self, forCellReuseIdentifier: "InfoMode")
        $0.register(ThemeListCell.self, forCellReuseIdentifier: "DMSMode")
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }
}

extension ThemeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexPathRow = indexPath.row
        switch indexPathRow {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlackMode") as! ThemeListCell
            cell.setup()
            cell.userMode.text = "다크 모드"
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WhiteMode") as! ThemeListCell
            cell.setup()
            cell.userMode.text = "화이트 모드"
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoMode") as! ThemeListCell
            cell.setup()
            cell.userMode.text = "INFO 모드"
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DMSMode") as! ThemeListCell
            cell.setup()
            cell.userMode.text = "DMS 모드"
            cell.backgroundColor = UIColor(named: "TableViewColor")
            cell.layer.cornerRadius = 20
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if (indexPath.row == 0) {
            print("다크모드")
            view.backgroundColor = .black
            themeView.backgroundColor = UIColor(named: "TableViewColor")
            themeMainFrameView.backgroundColor = UIColor(named: "CollectionViewColor")
            themeSubFrameView1.backgroundColor = UIColor(named: "333333")
            themeSubFrameView2.backgroundColor = UIColor(named: "333333")
            themeSubFrameView3.backgroundColor = UIColor(named: "333333")
            themeSubFrameView4.backgroundColor = UIColor(named: "333333")
        }
        
        if (indexPath.row == 1) {
            print("화이트 모드")
            view.backgroundColor = .white
            themeView.backgroundColor = UIColor(named: "WhiteBackGroundTheme")
            themeMainFrameView.backgroundColor = UIColor(named: "WhiteMainTheme")
            themeSubFrameView1.backgroundColor = UIColor(named: "WhiteSubTheme")
            themeSubFrameView2.backgroundColor = UIColor(named: "WhiteSubTheme")
            themeSubFrameView3.backgroundColor = UIColor(named: "WhiteSubTheme")
            themeSubFrameView4.backgroundColor = UIColor(named: "WhiteSubTheme")
        }
        
        if (indexPath.row == 2) {
            print("INFO 모드")
            view.backgroundColor = UIColor(named: "INFOBackGround")
            themeView.backgroundColor = UIColor(named: "INFOBackGroundTheme")
            themeMainFrameView.backgroundColor = UIColor(named: "INFOMainTheme")
            themeSubFrameView1.backgroundColor = UIColor(named: "INFOSubTheme")
            themeSubFrameView2.backgroundColor = UIColor(named: "INFOSubTheme")
            themeSubFrameView3.backgroundColor = UIColor(named: "INFOSubTheme")
            themeSubFrameView4.backgroundColor = UIColor(named: "INFOSubTheme")
        }
        
        if (indexPath.row == 3) {
            print("DMS 모드")
            view.backgroundColor = UIColor(named: "DMSBackGround")
            themeView.backgroundColor = UIColor(named: "DMSBackGroundTheme")
            themeMainFrameView.backgroundColor = UIColor(named: "DMSMainTheme")
            themeSubFrameView1.backgroundColor = UIColor(named: "DMSSubTheme")
            themeSubFrameView2.backgroundColor = UIColor(named: "DMSSubTheme")
            themeSubFrameView3.backgroundColor = UIColor(named: "DMSSubTheme")
            themeSubFrameView4.backgroundColor = UIColor(named: "DMSSubTheme")
        }
        
        return indexPath
    }
}
    
extension ThemeViewController {
    func setup() {
        [
            themeView,
            themeMainFrameView,
            themeSubFrameView1,
            themeSubFrameView2,
            themeSubFrameView3,
            themeSubFrameView4,
            tableViewButtons
        ].forEach { view.addSubview($0) }
        
        themeView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(142.0)
            $0.leading.trailing.equalToSuperview().inset(30.0)
            $0.height.equalTo(460)
            $0.width.equalTo(340)
        }
        
        themeMainFrameView.snp.makeConstraints {
            $0.top.equalTo(themeView.snp.top).offset(50.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(360)
        }
        
        themeSubFrameView1.snp.makeConstraints {
            $0.top.equalTo(themeMainFrameView.snp.top).offset(36.0)
            $0.leading.equalTo(themeMainFrameView.snp.leading).inset(20.0)
            $0.width.equalTo(160.0)
            $0.height.equalTo(28.0)
        }
        
        themeSubFrameView2.snp.makeConstraints {
            $0.top.equalTo(themeSubFrameView1.snp.bottom).offset(10.0)
            $0.leading.equalTo(themeSubFrameView1.snp.leading)
            $0.width.equalTo(160.0)
            $0.height.equalTo(130.0)
        }
        
        themeSubFrameView3.snp.makeConstraints {
            $0.top.equalTo(themeSubFrameView2.snp.bottom).offset(20.0)
            $0.leading.equalTo(themeSubFrameView2.snp.leading)
            $0.width.equalTo(90.0)
            $0.height.equalTo(100.0)
        }
        
        themeSubFrameView4.snp.makeConstraints {
            $0.top.equalTo(themeSubFrameView3.snp.top)
            $0.leading.equalTo(themeSubFrameView3.snp.trailing).offset(20.0)
            $0.width.equalTo(50.0)
            $0.height.equalTo(100.0)
        }
        
        tableViewButtons.snp.makeConstraints {
            $0.top.equalTo(themeView.snp.bottom).offset(28.0)
            $0.trailing.leading.bottom.equalToSuperview()
        }
    }
}
