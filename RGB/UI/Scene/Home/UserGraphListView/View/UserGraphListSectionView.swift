import SnapKit
import Then
import UIKit

final class UserGraphListSectionView: UIView {
    private final var controller: UIViewController
    
    var userGraphModelList = [UserGraphListModel]()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "내 보유 코인"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground

        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            UserGraphListSectionCell.self,
            forCellWithReuseIdentifier: "UserGraphListSectionCell"
        )

        return collectionView
    }()

    private let separatorView = SeparatorView(frame: .zero)

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        layout()
        attribute()
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserGraphListSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserGraphListSectionCell", for: indexPath) as! UserGraphListSectionCell
        cell.setup()
        cell.backgroundColor = UIColor(named: "CollectionViewColor")
        
        if indexPath.row == 0 {
            cell.titleLabel.text = "JUNHA"
            cell.descriptionLabel.text = "박준하"
            cell.coinPriceLabel.text = "152,894원"
            cell.inDecreaseLabel.text = "+12,000원(+15.7%)"
        }
        
        if indexPath.row == 1 {
            cell.titleLabel.text = "BLACKCH"
            cell.descriptionLabel.text = "최승우"
            cell.coinPriceLabel.text = "322,970원"
            cell.inDecreaseLabel.text = "+42,000원(+19.7%)"
        }
        
        if indexPath.row == 2 {
            cell.titleLabel.text = "Hyunseok"
            cell.descriptionLabel.text = "김현석"
            cell.coinPriceLabel.text = "122,894원"
            cell.inDecreaseLabel.text = "+15,120원(+12.6%)"
        }
        
        if indexPath.row == 3 {
            cell.titleLabel.text = "Moon"
            cell.descriptionLabel.text = "문성화"
            cell.coinPriceLabel.text = "1,412,894원"
            cell.inDecreaseLabel.text = "+352,000원(+65.7%)"
        }
        
        if indexPath.row == 4 {
            cell.titleLabel.text = "Taegon"
            cell.descriptionLabel.text = "임태곤"
            cell.coinPriceLabel.text = "12,894원"
            cell.inDecreaseLabel.text = "+100원(+0.52%)"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSuggesion = userGraphModelList[indexPath.row]
        print(userGraphModelList[indexPath.row])
        let detailViewController = UserGraphListDetailViewController()
        detailViewController.userGraphList = selectedSuggesion
        controller.present(detailViewController, animated: true)
    }
}

extension UserGraphListSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 64.0, height: frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 32.0, bottom: 0.0, right: 32.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 64.0
    }
}

private extension UserGraphListSectionView {
    
    func bind(_ viewModel: UserGraphListSectionViewModel) {
        
    }
    
    func attribute() {
        userGraphModelList = [
            UserGraphListModel(nowCoinPrice: 23456, changePercent: 5000, iTakeCoins: "20개", userImage: "없음", userName: "박준하"),
            UserGraphListModel(nowCoinPrice: 3256, changePercent: 75000, iTakeCoins: "12개", userImage: "없음", userName: "최승우"),
            UserGraphListModel(nowCoinPrice: 23552, changePercent: 600, iTakeCoins: "1개", userImage: "없음", userName: "김현석"),
            UserGraphListModel(nowCoinPrice: 64324, changePercent: 577000, iTakeCoins: "50개", userImage: "없음", userName: "문성화"),
            UserGraphListModel(nowCoinPrice: 38234, changePercent: 7000, iTakeCoins: "2개", userImage: "없음", userName: "임태콘")
        ]

    }
    
    func layout() {
        [
            titleLabel,
            collectionView,
            separatorView
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(25.0)
            $0.height.equalTo(240)
            $0.width.equalTo(370)
            $0.bottom.equalToSuperview()
        }

        separatorView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview()
        }
    }
}

