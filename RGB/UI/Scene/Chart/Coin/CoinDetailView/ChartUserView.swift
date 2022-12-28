//
//  ChartUserView.swift
//  RGB
//
//  Created by 박준하 on 2022/12/05.
//

import UIKit
import SnapKit
import Then
import ReusableKit
import Charts

class ChartUserView: UIView {
    
    private final var controller: UIViewController

    enum Reusable {
      static let tagCell = ReusableCell<TagCell>()
    }

    private var beforeSelected = 0
    // MARK: - Property

    // 뿌려줄 데이터
      private var tagList: [String] = ["1일", "1주", "1달", "1년", "최대"]

    // MARK: - View
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        layout()
        attribute()
        controller.title = "코인 거래"
        ListcollectionView.delegate = self
        ListcollectionView.dataSource = self
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//
//    override func loadView() {
//      let view = UIView()
//      view.backgroundColor = .systemBackground
//      self.view = view
//    }

    private lazy var imageView = UIImageView().then {
        $0.image = UIImage(named: "둥이배지")
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 15
    }

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }

    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }

    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32.0, weight: .bold)
        $0.textColor = .white
    }

    private var inDecreaseLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .semibold)
        $0.textColor = .red
    }

    private var chartView = LineChartView()

    let ListcollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
      let layout = LeftAlignedCollectionViewFlowLayout()
      layout.minimumLineSpacing = 20
      layout.minimumInteritemSpacing = 20
      layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
      
      $0.isScrollEnabled = false
      $0.collectionViewLayout = layout
      $0.backgroundColor = .systemBackground
      $0.register(Reusable.tagCell)
    }
    }

    extension ChartUserView: UICollectionViewDataSource {
    // cell갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tagList.count
    }

    // cell 선언
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(Reusable.tagCell, for: indexPath)

    cell.tagLabel.text = tagList[indexPath.item]

    return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
    //        collectionView.dequeue(Reusable.tagCell, for: IndexPath(row: beforeSelected, section: indexPath.section)).unselect()
        if(indexPath.row == beforeSelected) {
            return
        }
        
        if(indexPath.row == 1) {
            var dataArray: [ChartDataEntry] = []
            for i in 0...50 {
                dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
            }
            let dataSet = LineChartDataSet(entries: dataArray)
            dataSet.setColor(NSUIColor.red)
            dataSet.drawCirclesEnabled = false
            dataSet.drawValuesEnabled = false
            let chartData = LineChartData(dataSet: dataSet)
            chartView.data = chartData
            chartView.xAxis.enabled = false
            chartView.leftAxis.enabled = false
            chartView.rightAxis.enabled = false
            chartView.dragEnabled = false
            chartView.scaleXEnabled = false
            chartView.scaleYEnabled = false
            chartView.legend.enabled = false
        }
        
        if(indexPath.row == 2) {
            var dataArray: [ChartDataEntry] = []
            for i in 0...50 {
                dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
            }
            let dataSet = LineChartDataSet(entries: dataArray)
            dataSet.setColor(NSUIColor.red)
            dataSet.drawCirclesEnabled = false
            dataSet.drawValuesEnabled = false
            let chartData = LineChartData(dataSet: dataSet)
            chartView.data = chartData
            chartView.xAxis.enabled = false
            chartView.leftAxis.enabled = false
            chartView.rightAxis.enabled = false
            chartView.dragEnabled = false
            chartView.scaleXEnabled = false
            chartView.scaleYEnabled = false
            chartView.legend.enabled = false
        }
        
        if(indexPath.row == 3) {
            var dataArray: [ChartDataEntry] = []
            for i in 0...50 {
                dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
            }
            let dataSet = LineChartDataSet(entries: dataArray)
            dataSet.setColor(NSUIColor.red)
            dataSet.drawCirclesEnabled = false
            dataSet.drawValuesEnabled = false
            let chartData = LineChartData(dataSet: dataSet)
            chartView.data = chartData
            chartView.xAxis.enabled = false
            chartView.leftAxis.enabled = false
            chartView.rightAxis.enabled = false
            chartView.dragEnabled = false
            chartView.scaleXEnabled = false
            chartView.scaleYEnabled = false
            chartView.legend.enabled = false
        }
        
        if(indexPath.row == 0) {
            var dataArray: [ChartDataEntry] = []
            for i in 0...50 {
                dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
            }
            let dataSet = LineChartDataSet(entries: dataArray)
            dataSet.setColor(NSUIColor.red)
            dataSet.drawCirclesEnabled = false
            dataSet.drawValuesEnabled = false
            let chartData = LineChartData(dataSet: dataSet)
            chartView.data = chartData
            chartView.xAxis.enabled = false
            chartView.leftAxis.enabled = false
            chartView.rightAxis.enabled = false
            chartView.dragEnabled = false
            chartView.scaleXEnabled = false
            chartView.scaleYEnabled = false
            chartView.legend.enabled = false
        }
        
        (collectionView.cellForItem(at: IndexPath(row: beforeSelected, section: indexPath.section)) as! TagCell).unselect()
        
        (collectionView.cellForItem(at: indexPath) as! TagCell).select()
        
        beforeSelected = indexPath.row
        
    //        collectionView.dequeue(Reusable.tagCell, for: indexPath).select()
        
        
    //        if cell.clickCount == 1 {
    //            // clickCount가 1이면 이미 선택되어 있는 셀이므로 다시 회색으로 바꿔줘야 함 -> 값을 0으로 변경
    //            cell.clickCount = 0
    //        }
    //        else {
    //            cell.clickCount += 1
    //        }
    }
    }

    extension ChartUserView: UICollectionViewDelegateFlowLayout {
    // 셀 크기설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: 60.0, height: 30.0)
    }
    }


    extension ChartUserView {
    func bind() {
        
    }
    func attribute() {
        titleLabel.text = "junha"
        descriptionLabel.text = "박준하"
        coinPriceLabel.text = "152,894원"
        inDecreaseLabel.text = "+250원 (+2.14%)"
        
        var dataArray: [ChartDataEntry] = []
        for i in 0...50 {
            dataArray.append(ChartDataEntry(x: Double(i), y: Double.random(in: 0...120)))
        }
        let dataSet = LineChartDataSet(entries: dataArray)
        dataSet.setColor(NSUIColor.red)
        dataSet.drawCirclesEnabled = false
        dataSet.drawValuesEnabled = false
        let chartData = LineChartData(dataSet: dataSet)
        chartView.data = chartData
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.dragEnabled = false
        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        chartView.legend.enabled = false
    }
    func layout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel,
            inDecreaseLabel,
            chartView,
            ListcollectionView
        ].forEach { controller.view.addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30.0)
            $0.top.equalTo(controller.view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.width.equalTo(35.0)
            $0.height.equalTo(35.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
            $0.top.equalTo(imageView.snp.top)
        }

        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10.0)
            $0.leading.equalTo(imageView.snp.leading)
        }
        
        inDecreaseLabel.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(coinPriceLabel.snp.leading)
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(inDecreaseLabel.snp.bottom).offset(36.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200.0)
            $0.width.equalTo(430.0)
        }
        
        ListcollectionView.snp.makeConstraints {
            $0.top.equalTo(chartView.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.width.equalToSuperview()
        }
    }

}
