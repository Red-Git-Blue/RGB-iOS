//
//  NewsListPresenter.swift
//  RGB
//
//  Created by 박준하 on 2022/12/04.
//

import UIKit

protocol NewsListProtocol: AnyObject {
    func setupNavigationBar()
    func setupLayout()
    func endRefreshing()
}

final class NewsListPresenter: NSObject {
    private weak var viewController: NewsListProtocol?

    private var currentKeyword = ""
    // 지금까지 request 된, 가지고 있는 보여주고 있는 page가 어디인지
    private var currentPage: Int = 0
    // 한 페이지에 최대 몇 개까지 보여줄건지
    private let display: Int = 20

    init(viewController: NewsListProtocol) {
        self.viewController = viewController
    }

    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupLayout()
    }
}

//extension NewsListPresenter: NewsListTableViewHeaderViewDelegate {
//    func didSelectTag(_ selectedIndex: Int) {
//        currentKeyword = tags[selectedIndex]
//        requestNewsList(isNeededToReset: true)
//    }
//}

extension NewsListPresenter: UITableViewDelegate {}

extension NewsListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ListHeaderView.identfier) as? ListHeaderView
        
        header?.setup()
        return header
    }
}

private extension NewsListPresenter {
//    func requestNewsList(isNeededToReset: Bool) {
//        if isNeededToReset {
//            currentPage = 0
//            newsList = []
//        }
//
//        newsSearchManager.request(
//            from: currentKeyword,
//            start: (currentPage * display) + 1,
//            display: display
//        ) { [weak self] newValue in
//            self?.newsList += newValue
//            self?.currentPage += 1
//            self?.viewController?.reloadTableView()
//            self?.viewController?.endRefreshing()
//        }
//    }
}
