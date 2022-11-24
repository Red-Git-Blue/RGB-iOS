//
//  statsVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/19.
//

import UIKit
import Then
import SnapKit
import Charts
import RxSwift

class StatsViewController: BaseAbstractChart {
    
    let data = Observable<[String]>.just(["first","second","third",])
    
    let disposeBag = DisposeBag()
    
    var pieChartModelList = [MyStatsHoldingsChartView]()
    
    var statsChartData = [StatsChartData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()

        data.bind(to: tableView.rx.items(cellIdentifier: StatsUserTableViewCell.identifier, cellType: StatsUserTableViewCell.self)) {
            index, item, cell in
            cell.img.image = UIImage(named: "MainBage")
            cell.userName.text = "view \(index)"
        }
        .disposed(by: disposeBag)
    }
    
    override func viewIndex() -> Int {
        return 1
    }
    
    private lazy var pieChartView = PieChartView().then {
        $0.delegate = self
        $0.backgroundColor = .red
    }
    
    func statsOverviewList(myStatsHoldingsChartView: MyStatsHoldingsChartView) -> [StatsChartData] {
      return [
        myStatsHoldingsChartView.jjunhaa0211,
//        myStatsHoldingsChartView.hahahaha
      ]
    }
    
    func configureChartView(statsOverviewListData: [StatsChartData]) {
        let entries = statsOverviewListData.compactMap { [weak self] overview -> PieChartDataEntry? in
          guard let self = self else { return nil }
          return PieChartDataEntry(
            value: self.removeFormatString(string: overview.holdingsCount),
            data: overview
          )
        }
        let dataSet = PieChartDataSet(entries: entries, label: "통계")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueTextColor = .black
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3

        dataSet.colors = ChartColorTemplates.vordiplom()
          + ChartColorTemplates.joyful()
          + ChartColorTemplates.colorful()
          + ChartColorTemplates.liberty()
          + ChartColorTemplates.pastel()
          + ChartColorTemplates.material()
        
        self.pieChartView.data = PieChartData(dataSet: dataSet)
        self.pieChartView.spin(duration: 0.3, fromAngle: pieChartView.rotationAngle, toAngle: pieChartView.rotationAngle + 80)
    }
    
    func removeFormatString(string: String) -> Double {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      return formatter.number(from: string)?.doubleValue ?? 0
    }
    
    private lazy var tableView = UITableView().then {
        $0.register(StatsUserTableViewCell.self, forCellReuseIdentifier: StatsUserTableViewCell.identifier)
        $0.delegate = self
    }
    
    private lazy var allAssetsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "총 자산"
    }
    
    private lazy var userAllAsstsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32.0, weight: .bold)
        $0.textColor = .white
        $0.text = "482,930원"
    }
    
    private lazy var allDamageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "총 손익"
    }
    
    private lazy var userAllDamageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
        $0.text = "482,930원"
    }
    
    private lazy var percentDamgeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .red
        $0.text = "(+34.21%)"
    }
}

extension StatsViewController {
    func setup() {
        [
            tableView,
            pieChartView,
            allAssetsLabel,
            userAllAsstsLabel,
            allDamageLabel,
            userAllDamageLabel,
            percentDamgeLabel
        ].forEach { view.addSubview($0) }
        
        tableView.snp.makeConstraints {
//            $0.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0))
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.equalTo(220)
            $0.width.equalTo(150)
        }
        
        pieChartView.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.top.equalTo(tableView.snp.top)
            $0.trailing.equalToSuperview().inset(13.0)
//            $0.trailing.equalTo(tableView.snp.leading).inset(17.0)
            $0.height.width.equalTo(220.0)
        }
        
        allAssetsLabel.snp.makeConstraints {
            $0.top.equalTo(pieChartView.snp.bottom).offset(42)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        userAllAsstsLabel.snp.makeConstraints {
            $0.top.equalTo(allAssetsLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(allAssetsLabel.snp.leading)
        }
        
        allDamageLabel.snp.makeConstraints {
            $0.top.equalTo(userAllAsstsLabel.snp.bottom).offset(40.0)
            $0.leading.equalTo(userAllAsstsLabel.snp.leading)
        }
        
        userAllDamageLabel.snp.makeConstraints {
            $0.top.equalTo(allDamageLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(allDamageLabel.snp.leading)
        }
        
        percentDamgeLabel.snp.makeConstraints {
            $0.top.equalTo(userAllDamageLabel.snp.bottom).offset(6.0)
            $0.leading.equalTo(userAllDamageLabel.snp.leading)
        }
    }
}


extension StatsViewController: ChartViewDelegate {
//  func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//    guard let covidDetailViewController = self.storyboard?.instantiateViewController(identifier: "CovidDetailViewController") as? CovidDetailViewController else {
//         return
//       }
//    guard let covidOverview = entry.data as? CovidOverview else { return }
//    covidDetailViewController.covidOverview = covidOverview
//    self.navigationController?.pushViewController(covidDetailViewController, animated: true)
//  }
}



extension StatsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
