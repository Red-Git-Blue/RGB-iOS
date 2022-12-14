import UIKit
import SnapKit
import Then

class PopularCoinView: UIView {
    private final var controller: UIViewController
    
    var suggesionModelList = [GetCoinUserListModel]()
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var popularCoinText = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "인기 코인"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 60.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 30.0, bottom: 10.0, right: 30.0)

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            SuggestionFeatureCollectionViewCell.self,
            forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell"
        )

        return collectionView
    }()

    private let separatorView = SeparatorView(frame: .zero)

}

extension PopularCoinView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.frame.width - 60.0,
            height: SuggestionFeatureCollectionViewCell.height
        )
    }
}

extension PopularCoinView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RankingFeatureCollectionViewCell",
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
        let selectedSuggesion = suggesionModelList[indexPath.row]
        print(suggesionModelList[indexPath.row])
        let detailViewController = SuggesionDetailViewController()
        detailViewController.suggestion = selectedSuggesion
        controller.present(detailViewController, animated: true)
    }
}

extension PopularCoinView {
    
    func bind(_ viewModel: PopularCoinViewModel) {
        
    }
    
    func attribute() {
        
    }
    
    func layout() {
        [
            popularCoinText,
            collectionView
        ].forEach { self.addSubview($0) }
        
        popularCoinText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(popularCoinText.snp.bottom).offset(12.0)
            $0.height.equalTo(SuggestionFeatureCollectionViewCell.height * 5)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
