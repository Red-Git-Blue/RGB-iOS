import SnapKit
import Then
import UIKit
import RxSwift
import RxCocoa
import RxRelay

final class AdvertisementSectionView: UIView {
    private final var controller: UIViewController
    private let viewReceive = PublishRelay<Void>()
    var array = ["1","2","3","4","5"]
    
    var getAdvertiseNowList: GetAdvertiseNowModel?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            AdvertisementCollectionViewCell.self,
            forCellWithReuseIdentifier: AdvertisementCollectionViewCell.identifier
        )

        return collectionView
    }()

    private let separatorView = SeparatorView(frame: .zero)
    
    override func layoutSubviews() {
        viewReceive.accept(())
        bind(AdvertiosementSectionViewModel())
    }

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

extension AdvertisementSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 60.0, height: frame.width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 60.0
    }
}

private extension AdvertisementSectionView {
    
    func bind(_ viewModel: AdvertiosementSectionViewModel) {
        let input = AdvertiosementSectionViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))
                                                   
        let output = viewModel.trans(input)
        
        output.advertiseNow.subscribe(onNext: { data in
            self.getAdvertiseNowList = data
            
            let data = Observable<[String]>.of(self.array)
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                        .items(
                            cellIdentifier: AdvertisementCollectionViewCell.identifier,
                            cellType: AdvertisementCollectionViewCell.self)
                ) { [self] index, recommend, cell in
                    cell.setupLayout()
                    cell.configure(with: getAdvertiseNowList!, index)
                    cell.backgroundColor = UIColor(named: "CollectionViewColor")
                }
            
            print("print 결과 :\(self.getAdvertiseNowList!)")
        })
    }
    
    func attribute() {
        
    }
    
    func layout() {
        [
            collectionView
        ].forEach { addSubview($0) }

        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(120)
            $0.width.equalTo(370)
            $0.bottom.equalToSuperview()
        }
    }
}
