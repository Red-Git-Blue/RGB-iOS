import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxRelay

class CategorySectionView: UIView {
    private final var controller: UIViewController
    private let viewReceive = PublishRelay<Void>()
    var getCategoryList: GetCategoryListModel?
    
    var array = ["first","second","third","fourth","fifth"]
    
    private lazy var categoryLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24.0, weight: .black)
        $0.text = "카테고리"
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
            CategorySectionViewCell.self,
            forCellWithReuseIdentifier: "CategoryCollectionViewCell"
        )
        
      return collectionView
    }()
    
    private lazy var separator = UIView().then {
        $0.backgroundColor = .separator
    }
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
        collectionView.reloadData()
//        collectionView.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategorySectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: CategorySectionViewCell.width,
            height: CategorySectionViewCell.height
        )
    }
}

//extension CategorySectionView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: "CategoryCollectionViewCell",
//            for: indexPath
//        ) as? CategorySectionViewCell
//        cell!.backgroundColor = UIColor(named: "CollectionViewColor")
//        cell!.layer.cornerRadius = 20
//        return cell ?? UICollectionViewCell()
//    }
//  }

extension CategorySectionView {
    
    func bind(_ viewModel: CategoryViewModel) {
        
        let input = CategoryViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))
        
        let output = viewModel.trans(input)
        
        output.categoryView.subscribe(onNext: { dataValue in
            self.getCategoryList = dataValue
            
            let data = Observable<[String]>.of(self.array)
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                        .items(
                            cellIdentifier: CategoryCollectionViewCell.identifier,
                            cellType: CategoryCollectionViewCell.self)
                ) { index, recommend, cell in
                    cell.layout()
                    let item = self.getCategoryList?.content[index]
                    cell.forceLoadData(item!.categoryName)
                    cell.configure(with: self.getCategoryList!, index)
                    cell.imageView.image = UIImage(named: "CateforyCollectionViewCell")
                    cell.layer.cornerRadius = 10
                }
            
            print("구독이후 터짐")
        })
    }
    
    func attribute() {
        self.backgroundColor = .black
    }
    
    func layout() {
        [
            categoryLabel,
            collectionView,
            separator
        ].forEach { self.addSubview($0) }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30.0)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(categoryLabel.snp.bottom).offset(20.0)
            $0.height.equalTo(100)
            $0.width.equalTo(100)
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
