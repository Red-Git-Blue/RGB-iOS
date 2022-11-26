//
//  BagesDetailGiftViewController.swift
//  RGB
//
//  Created by 박준하 on 2022/11/26.
//

import UIKit
import SnapKit
import Then

class BagesDetailGiftViewController: UIViewController {
    
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
            GiftCollectionViewCell.self,
            forCellWithReuseIdentifier: "GiftCollectionViewCell"
        )

        return collectionView
    }()
    
    private lazy var bagesImage = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    private lazy var bagesName = UILabel().then {
        $0.text = "고급스러운 무의 배지"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
    
    private lazy var personHoldingLabel = UILabel().then {
        $0.text = "83,463,910,234원 보유중"
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .gray
    }
    
    private lazy var bagesPrice = UILabel().then {
        $0.text = "12,000원"
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var giftButton = UIButton().then {
        $0.setTitle("선물하기", for: .normal)
        $0.setTitleColor(UIColor(ciColor: .white), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.backgroundColor = .green
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        collectionView.reloadData()
        
    }
}

extension BagesDetailGiftViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: 370,
//            height: SuggestionFeatureCollectionViewCell.height
            height: 75
        )
    }
}

extension BagesDetailGiftViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GiftCollectionViewCell",
            for: indexPath
        ) as? GiftCollectionViewCell
//        let rankingFeature = rankingFeatureList[indexPath.item]
//        cell?.setup(rankingFeature: rankingFeature)
        
        cell?.setup()
        cell?.backgroundColor = UIColor(named: "CollectionViewColor")
        cell?.layer.cornerRadius = 20
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: Private method
private extension BagesDetailGiftViewController {
    
    func bind(_ viewModel: SuggestionCoinViewModel) {
        
    }
    
    func attribute() {
        title = "선물하기"
        bagesImage.layer.cornerRadius = 20
        giftButton.layer.cornerRadius = 20
    }
    
    func layout() {
        [collectionView,
         bagesImage,
         bagesName,
         personHoldingLabel,
         bagesPrice,
         giftButton]
            .forEach { view.addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
//            $0.height.equalTo(GiftCollectionViewCell.height)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(650)
//            $0.bottom.equalToSuperview()
        }
        
        bagesImage.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10.0)
            $0.leading.equalToSuperview().inset(30.0)
            $0.height.equalTo(60)
            $0.width.equalTo(60)
        }
        
        bagesName.snp.makeConstraints {
            $0.top.equalTo(bagesImage.snp.top).offset(5.0)
            $0.leading.equalTo(bagesImage.snp.leading).inset(70.0)
        }
        
        personHoldingLabel.snp.makeConstraints {
            $0.top.equalTo(bagesName.snp.bottom).offset(8.0)
            $0.leading.equalTo(bagesName.snp.leading)
        }
        
        bagesPrice.snp.makeConstraints {
            $0.top.equalTo(personHoldingLabel.snp.bottom).offset(20.0)
            $0.leading.equalTo(bagesImage.snp.leading)
        }
        
        giftButton.snp.makeConstraints {
            $0.top.equalTo(bagesPrice.snp.bottom).offset(25.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50.0)
            $0.width.equalTo(370.0)
        }
        
    }

}
