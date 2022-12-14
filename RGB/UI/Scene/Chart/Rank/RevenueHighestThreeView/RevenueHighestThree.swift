import SnapKit
import Then
import UIKit

final class RevenueHighestThree: UIView {
    private final var controller: UIViewController
    
    var suggesionModelList = [GetCoinUserListModel]()

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "수익률 TOP 3"
    }

    private lazy var showAllAppsButton = UIButton().then {
        $0.setTitle("더보기 >", for: .normal)
        $0.setTitleColor(UIColor(named: "errorColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
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
}

extension RevenueHighestThree: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.frame.width - 60.0,
            height: SuggestionFeatureCollectionViewCell.height
        )
    }
}

extension RevenueHighestThree: UICollectionViewDataSource {
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
        
        if(indexPath.row == 0) {
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor.white.cgColor
            cell?.layer.shadowColor = UIColor.yellow.cgColor
            cell?.layer.shadowOpacity = 2
            cell?.layer.shadowRadius = 10
            cell?.backgroundColor = UIColor(named: "CollectionViewColor")
            cell?.layer.cornerRadius = 20
            cell!.titleLabel.text = "JUNHA0211"
            cell!.descriptionLabel.text = "최고의 코인"
            cell!.coinPriceLabel.text = "152,894"
            cell!.inDecreaseLabel.text = "+15.7%"
            return cell!
        }
        
        if(indexPath.row == 1) {
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor.white.cgColor
            cell?.layer.shadowColor = UIColor.white.cgColor
            cell?.layer.shadowOpacity = 2
            cell?.layer.shadowRadius = 10
            cell?.backgroundColor = UIColor(named: "CollectionViewColor")
            cell?.layer.cornerRadius = 20
            cell!.titleLabel.text = "JUNHA0211"
            cell!.descriptionLabel.text = "최고의 코인"
            cell!.coinPriceLabel.text = "152,894"
            cell!.inDecreaseLabel.text = "+15.7%"
            return cell!
        }
        
        if(indexPath.row == 2) {
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor.white.cgColor
            cell?.layer.shadowColor = UIColor.orange.cgColor
            cell?.layer.shadowOpacity = 2
            cell?.layer.shadowRadius = 10
            cell?.backgroundColor = UIColor(named: "CollectionViewColor")
            cell?.layer.cornerRadius = 20
            cell!.titleLabel.text = "JUNHA0211"
            cell!.descriptionLabel.text = "최고의 코인"
            cell!.coinPriceLabel.text = "152,894"
            cell!.inDecreaseLabel.text = "+15.7%"
            return cell!
        }
        
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
        let detailViewController = CoinDetailViewController()
        detailViewController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: Private method
private extension RevenueHighestThree {
    
    func attribute() {
//        suggesionModelList = [
//            SuggesionModel(name: "이름", imageURL: "대충 주소", pk: 3, price: 36789, changePercent: 178),
//            SuggesionModel(name: "이름2", imageURL: "대충 주소2", pk: 4, price: 346789, changePercent: 678),
//            SuggesionModel(name: "이름3", imageURL: "대충 주소3", pk: 64126, price: 336789, changePercent: 178),
//            SuggesionModel(name: "이름4", imageURL: "대충 주소4", pk: 3745, price: 34326789, changePercent: 1478),
//            SuggesionModel(name: "이름5", imageURL: "대충 주소5", pk: 2385, price: 34327, changePercent: 7248),
//            SuggesionModel(name: "이름6", imageURL: "대충 주소6", pk: 234783, price: 3347289, changePercent: 18),
//            SuggesionModel(name: "이름7", imageURL: "대충 주소7", pk: 234783, price: 3347289, changePercent: 18),
//            SuggesionModel(name: "이름8", imageURL: "대충 주소8", pk: 234783, price: 3347289, changePercent: 18),
//            SuggesionModel(name: "이름9", imageURL: "대충 주소6", pk: 2234783, price: 334743289, changePercent: 1318),
//            SuggesionModel(name: "이름10", imageURL: "대충 주소6", pk: 2374783, price: 3347326289, changePercent: 118),
//        ]
    }
    
    func layout() {
        [titleLabel, showAllAppsButton,collectionView, separatorView]
            .forEach { addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40.0)
            $0.top.equalToSuperview().inset(30.0)
            $0.trailing.equalTo(showAllAppsButton.snp.leading).offset(8.0)
        }

        showAllAppsButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(29.9)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24.0)
            $0.height.equalTo(SuggestionFeatureCollectionViewCell.height * 4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        separatorView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
