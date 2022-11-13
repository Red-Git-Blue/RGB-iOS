import SnapKit
import Then
import UIKit

final class advertisementView: UIView {
    private final var controller: UIViewController
    
//    var userGraphModelList = [UserGraphListModel]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        //딱딱하나씩 끈어질 수 있도록하는 것
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        //스크롤바 표시
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "advertisementSectionCollectionViewCell"
        )

        return collectionView
    }()
    
    private let categoryLabel = UILabel().then {
        $0.text = "카테고리"
        $0.font = .systemFont(ofSize: 24.0, weight: .bold)
        $0.textColor = .label
    }

    private let separatorView = SeparatorView(frame: .zero)

    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        setupViews()
        collectionView.reloadData()
        
//        collectionView.layer.cornerRadius = 20
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension advertisementView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "advertisementSectionCollectionViewCell", for: indexPath)
        cell.backgroundColor = UIColor(named: "CollectionViewColor")
//        cell.contentView.layer.cornerRadius = 10.0
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedSuggesion = userGraphModelList[indexPath.row]
//        print(userGraphModelList[indexPath.row])
//        let detailViewController = UserGraphListDetileViewController()
//        detailViewController.userGraphList = selectedSuggesion
//        controller.present(detailViewController, animated: true)
//    }
}

extension advertisementView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //주변의 왼 = 16 // 오른 = 16 == 32 뺴기
        CGSize(width: collectionView.frame.width - 60.0, height: frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //주변의 왼 = 16 // 오른 = 16
        //중앙 정령
        UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //최소 마진
        return 60.0
    }
}

private extension advertisementView {
    func setupViews() {
        [
            collectionView,
            categoryLabel
        ].forEach { addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(120)
            $0.width.equalTo(370)
            $0.bottom.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).inset(30.0)
            $0.leading.equalTo(collectionView.snp.leading)
        }
    }
}
