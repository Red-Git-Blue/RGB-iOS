import UIKit
import Then
import SnapKit
import PContributionsView

class GrassSectionView: UIView {
    private final var controller: UIViewController
    
    var grassSection = [GrassSectionModel]()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "잔디"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 60.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            GrasscollectionViewCell.self,
            forCellWithReuseIdentifier: "GrasscollectionViewCell"
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

extension GrassSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GrasscollectionViewCell",
            for: indexPath
        ) as! GrasscollectionViewCell
        
        let modal = grassSection[0]
        
        var list = [[Int]]()
        var tmpList = [Int]()
        
        for i in 0..<modal.contributions.count - 1 {
            tmpList.append(modal.contributions[i].level)
            if(i % 5 == 4) {
                list.append(tmpList)
                tmpList = [Int]()
            }
        }
        if(!tmpList.isEmpty) {
            while(tmpList.count >= 5) {
                tmpList.append(-1)
            }
            list.append(tmpList)
        }
        cell.setup(data: list)
        print(list)
        
        cell.backgroundColor = UIColor(named: "CollectionViewColor")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSuggesion = grassSection[indexPath.row]
        print(grassSection[indexPath.row])
        let detailViewController = GrassSectionDetilViewController()
        detailViewController.updateData(selectedSuggesion)
        controller.present(detailViewController, animated: true)
    }
}

extension GrassSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 64.0, height: frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 64.0
    }
}

private extension GrassSectionView {
    
    func attribute() {
        contentsLoad()
    }
    
    func layout() {
        [
            titleLabel,
            collectionView,
            separatorView
        ].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40.0)
            $0.top.equalToSuperview().inset(30.0)
        }

        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(140)
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
    
    func contentsLoad() {
        var contents = [Contribution]()
        for _ in 0...34 {
            contents.append(Contribution(date: "2022-12-14", count: Int.random(in: 0...100), level: Int.random(in: 0...4)))
            
        }
        
        grassSection.append(GrassSectionModel(userName: "UserName", contributions: contents))
    }
    
}
