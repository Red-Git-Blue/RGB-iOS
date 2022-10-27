//
//  MyCoinVIew.swift
//  RGB
//
//  Created by 박준하 on 2022/10/27.
//

import UIKit
import SnapKit
import Then

class MyCoinView: UIView {
    private var featureList: [Feature] = []

    private lazy var collectionView = UICollectionView().then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,
            collectionViewLayout: layout)
        $0.delegate = self
        $0.dataSource = self
        $0.isPagingEnabled = true
        $0.backgroundColor = .systemBackground
        $0.showsHorizontalScrollIndicator = false
        $0.register(
            MyCoinCell.self,
            forCellWithReuseIdentifier: "MyCoinCell"
        )
    }
}

extension MyCoinView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCoinCell", for: indexPath) as? MyCoinCell
        let feature = featureList[indexPath.item]
        cell?.setup(feature: feature)

        return cell ?? UICollectionViewCell()
    }
    
}
