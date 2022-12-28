//
//  FundsHighestListVC.swift
//  RGB
//
//  Created by 박준하 on 2022/11/29.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import SnapKit

class FundsHighestThreePlusViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "자금 순서"
        view.backgroundColor = .black
        layout()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0, right: 10.0)

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            SuggestionFeatureCollectionViewCell.self,
            forCellWithReuseIdentifier: "SuggestionFeatureCollectionViewCell"
        )

        return collectionView
    }()
}
extension FundsHighestThreePlusViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 370,
//            height: SuggestionFeatureCollectionViewCell.height
            height: 75
        )
    }
}

extension FundsHighestThreePlusViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SuggestionFeatureCollectionViewCell",
            for: indexPath
        ) as? SuggestionFeatureCollectionViewCell
//        let rankingFeature = rankingFeatureList[indexPath.item]
//        cell?.setup(rankingFeature: rankingFeature)
        
        cell?.layout()
        cell?.backgroundColor = UIColor(named: "CollectionViewColor")
        cell?.layer.cornerRadius = 20
        cell!.titleLabel.text = "JUNHA0211"
        cell!.descriptionLabel.text = "최고의 코인"
        cell!.coinPriceLabel.text = "152,894"
        cell!.inDecreaseLabel.text = "+15.7%"

        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
        let detailViewController = CoinDetailViewController()
        detailViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

private extension FundsHighestThreePlusViewController {
    
//    func bind(_ viewModel: SuggestionCoinViewModel) {
//
//    }
    
    func attribute() {
        
    }
    
    func layout() {
        [
            collectionView
        ]
            .forEach { view.addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
//            $0.height.equalTo(GiftCollectionViewCell.height)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
    }

}
