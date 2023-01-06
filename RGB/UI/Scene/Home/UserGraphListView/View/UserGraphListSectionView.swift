import SnapKit
import RxRelay
import Then
import UIKit
import RxSwift
import RxCocoa

final class UserGraphListSectionView: UIView {
    private final var controller: UIViewController
    private let viewReceive = PublishRelay<Void>()
    var userGraphModelList: OwnedCoinsModel?
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "내 보유 코인"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
//        collectionView.dataSource = self

        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground

        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            UserGraphListSectionCell.self,
            forCellWithReuseIdentifier: UserGraphListSectionCell.identifier
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
        bind(UserGraphListSectionViewModel())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension UserGraphListSectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSuggesion = userGraphModelList!.content[indexPath.row]
        print(userGraphModelList!.content[indexPath.row])
        let detailViewController = UserGraphListDetailViewController()
        detailViewController.userGraphList = selectedSuggesion
        controller.present(detailViewController, animated: true)
    }
}

private extension UserGraphListSectionView {
    
    func bind(_ viewModel: UserGraphListSectionViewModel) {
        let input = UserGraphListSectionViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))

        let output = viewModel.trans(input)

        output.graphModelList.subscribe(onNext: { dataValue in
            self.userGraphModelList = dataValue
            
            self.userGraphModelList?.content.append(OwnedCoinsModel.Content(coinID: 0, name: "asdf", ownerName: "소유자", startPrice: 100, price: 120, boughtPrice: 110, boughtAmount: 5, previousPrice: 110, maxPrice: 130, minPrice: 90, totalBuyCount: 10, totalSellCount: 5, increment: OwnedCoinsModel.Increment(difference: 100, percent: 1.0), imageURL: nil, graph: []))

            let data = Observable<[OwnedCoinsModel.Content]>.of(self.userGraphModelList!.content)

            print("userGraphList까지는 들어옴")
            print("안에는 이딴게 들었음: \(self.userGraphModelList?.content)")
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                    .items(cellIdentifier: UserGraphListSectionCell.identifier, cellType: UserGraphListSectionCell.self)
                ) { index, recommend, cell in
                    print("데이터불러오기 성공")
                    cell.layout()
                    cell.backgroundColor = UIColor(named: "CollectionViewColor")
                    cell.layer.cornerRadius = 20
                    let item = self.userGraphModelList?.content[index]
                    cell.setDataArray(item!.graph)
                    cell.attribute()
                }.dispose()
            
            print("dkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdkdk")
        })
    }
    
    func attribute() {
//        userGraphModelList = [
//            UserGraphListModel(nowCoinPrice: 23456, changePercent: 5000, iTakeCoins: "20개", userImage: "없음", userName: "박준하"),
//            UserGraphListModel(nowCoinPrice: 3256, changePercent: 75000, iTakeCoins: "12개", userImage: "없음", userName: "최승우"),
//            UserGraphListModel(nowCoinPrice: 23552, changePercent: 600, iTakeCoins: "1개", userImage: "없음", userName: "김현석"),
//            UserGraphListModel(nowCoinPrice: 64324, changePercent: 577000, iTakeCoins: "50개", userImage: "없음", userName: "문성화"),
//            UserGraphListModel(nowCoinPrice: 38234, changePercent: 7000, iTakeCoins: "2개", userImage: "없음", userName: "임태콘")
//        ]

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

