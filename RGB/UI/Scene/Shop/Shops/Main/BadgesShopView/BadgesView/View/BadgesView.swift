import UIKit
import Moya
import Then
import SnapKit
import RxCocoa
import RxSwift

class BadgesView: UIView {
    private final var controller: UIViewController
    private final var viewName: String
    private let viewReceive = PublishRelay<Void>()
    
    var array = ["1","2","3","4"]
    
    var getBadgeShopList: GetBadgeShopListModel?
    let disposeBag = DisposeBag()
        
    private lazy var newBadgeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "신규 배지"
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.delegate = self
//        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false

        
        collectionView.register(
            BadgesCell.self,
            forCellWithReuseIdentifier: BadgesCell.identifier
        )
        
      return collectionView
    }()
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    override func layoutSubviews() {
        viewReceive.accept(())
        bind(BadgesViewModel())
    }
    
    init(frame: CGRect, viewController: UIViewController, viewName: String) {
        controller = viewController
        self.viewName = viewName
        super.init(frame: frame)
        newBadgeLabel.text = viewName
                
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BadgesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: BadgesCell.width,
            height: BadgesCell.height
        )
    }
}

extension BadgesView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let detailViewController = BagesDetailViewController(id: (getBadgeShopList?.content[indexPath.row].id)!)
        detailViewController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension BadgesView {
    
    func bind(_ viewModel: BadgesViewModel) {
        
        let input = BadgesViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))
                                                   
        let output = viewModel.trans(input)
        
        output.shopBadgeView.subscribe(onNext: { dataValue in
            self.getBadgeShopList = dataValue
            
            let data = Observable<[String]>.of(self.array)
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                        .items(cellIdentifier: BadgesCell.identifier,
                               cellType: BadgesCell.self)
                ) { index, recommend, cell in
                    cell.layout()
                    let item = self.getBadgeShopList?.content[index]
                    cell.forceLoadData(item!.name, item!.introduction, item!.price)
                    cell.configure(with: self.getBadgeShopList!, index)
                    cell.backgroundColor = .clear
            }
    })
}
    
    func attribute() {
        self.backgroundColor = .black
    }
    
    func layout() {
        [
            newBadgeLabel,
            collectionView,
            separator
        ].forEach { self.addSubview($0) }
        
        newBadgeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(newBadgeLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(310)
            $0.width.equalTo(220)
            $0.bottom.equalToSuperview()
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30.0)
            $0.height.equalTo(1)
            $0.width.equalTo(370)
            $0.centerX.equalToSuperview()
        }
    }
}
