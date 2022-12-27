import SnapKit
import Then
import UIKit
import RxCocoa
import RxSwift
import CoreLocation

final class SuggestionCoinSectionView: UIView {    
    private final var controller: UIViewController
    private let viewReceive = PublishRelay<Void>()
    var getCoinList: GetCoinUserListModel?
    
    let disposeBag = DisposeBag()
    
    var array = ["1","2","3","4","5","6","7","8","9","10","11","12"]

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "추천 코인"
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
        viewReceive.accept(())
        bind(SuggestionCoinViewModel())
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SuggestionCoinSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: collectionView.frame.width - 60.0,
            height: SuggestionFeatureCollectionViewCell.height
        )
    }
}

extension SuggestionCoinSectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(suggesionModelList[indexPath.row])
        let detailViewController = CoinDetailViewController()
        detailViewController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: Private method
private extension SuggestionCoinSectionView {
    
    func bind(_ viewModel: SuggestionCoinViewModel) {
        print("SuggestionCoinSectionView ViewModel 입니다")

        let input = SuggestionCoinViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))

        let output = viewModel.trans(input)
        
        output.coinList.subscribe(onNext: { dataValue in
            self.getCoinList = dataValue
            
            let data = Observable<[String]>.of(self.array)
            
            print("하하하")
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                    .items(cellIdentifier: SuggestionFeatureCollectionViewCell.identifier, cellType: SuggestionFeatureCollectionViewCell.self)
                ) { index, recommend, cell in
                    cell.layout()
                    cell.backgroundColor = UIColor(named: "CollectionViewColor")
                    cell.layer.cornerRadius = 20
                    let item = self.getCoinList?.content[index]
//                    cell.forceLoadData(item!.ownerName, item!.name, item?.price, item?.increment)
                    cell.configure(with: self.getCoinList!, index)
                }
        })
    }
    
    func attribute() {
    }
    
    func layout() {
        [titleLabel, collectionView, separatorView]
            .forEach { addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(40.0)
            $0.top.equalToSuperview().inset(30.0)
            $0.trailing.equalToSuperview()
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
