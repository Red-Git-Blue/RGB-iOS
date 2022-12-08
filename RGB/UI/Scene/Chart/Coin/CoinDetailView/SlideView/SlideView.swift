//
//  SlideView.swift
//  RGB
//
//  Created by 박준하 on 2022/12/08.
//

import UIKit
import SnapKit
import Then

class SlideView: UIView {
    
    private final var controller: UIViewController
    
    // MARK: Constant
    private enum Constant {
        static let collectionViewCellSize = CGSize(width: 420.0, height: 276.0)
        static let collectionViewCellSpacing = 0.0
        static let collectionViewContentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let collectionViewHeight = 276.0
    }
    
    // MARK: UI
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = Constant.collectionViewCellSpacing
            $0.minimumInteritemSpacing = Constant.collectionViewCellSpacing
            $0.itemSize = Constant.collectionViewCellSize
        }
    ).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = Constant.collectionViewContentInset
        $0.backgroundColor = .black
        $0.register(BuySellCell.self, forCellWithReuseIdentifier: BuySellCell.id)
        $0.register(DetailCoinCell.self, forCellWithReuseIdentifier: DetailCoinCell.id)
        $0.isPagingEnabled = true
    }
//    private let indicatorView = IndicatorView()
    
    // MARK: Properties
    private var items = (1...2)
        .map(String.init)
        .map { MyModel(backgroundColor: UIColor(named: $0)) }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attributes()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SlideView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: BuySellCell.id, for: indexPath) as! BuySellCell
        
        var cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCoinCell.id, for: indexPath) as! DetailCoinCell
        
        if indexPath.row == 0 {
            return cell1
        } else {
            return cell2
        }
    }
}

extension SlideView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scroll = scrollView.contentOffset.x + scrollView.contentInset.left
        let width = scrollView.contentSize.width + scrollView.contentInset.left + scrollView.contentInset.right
        let scrollRatio = scroll / width
        
//        self.indicatorView.leftOffsetRatio = scrollRatio
    }
}

extension SlideView {
    func bind() {
        
    }
    
    func attributes() {
        let allWidth = self.collectionView.contentSize.width + self.collectionView.contentInset.left + self.collectionView.contentInset.right
        let showingWidth = self.collectionView.bounds.width
//        self.indicatorView.widthRatio = showingWidth / allWidth
//        self.indicatorView.layoutIfNeeded()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func layout() {
        [
            collectionView,
//            indicatorView
        ].forEach { controller.view.addSubview($0) }
        
        self.collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(570.0)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(Constant.collectionViewHeight)
        }
//        self.indicatorView.snp.makeConstraints {
//            $0.top.equalTo(self.collectionView.snp.top)
//            $0.left.right.equalTo(self.collectionView).inset(100)
//            $0.height.equalTo(4)
//        }
    }
}
