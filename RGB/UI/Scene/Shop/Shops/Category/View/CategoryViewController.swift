import UIKit
import RxSwift
import RxCocoa
import CoreLocation
import Then

class CategoryViewController: BaseAbstractShop {
    
    override func viewIndex() -> Int {
        return 1
    }
    private let viewReceive = PublishRelay<Void>()
    var getCategoryList: GetCategoryListModel?
    
    var array = ["first","second"]
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        bind(CategoryViewModel())
    }
}

extension CategoryViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing : CGFloat = 10
        
        let width : CGFloat = (collectionView.bounds.width - 20 - itemSpacing * 2) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)가 눌렸어")
    }
}

extension CategoryViewController {
    
    func bind(_ viewModel: CategoryViewModel) {
        
        print("CategoryViewController bind를 거침")
        
        let input = CategoryViewModel.Input(viewReceive: viewReceive.asDriver(onErrorJustReturn: ()))
        
        let output = viewModel.trans(input)
        
        output.categoryView.subscribe(onNext: { dataValue in
            self.getCategoryList = dataValue
            
            let data = Observable<[String]>.of(self.array)
            
            print("구독은 됨")
            
            data.asObservable()
                .bind(to: self.collectionView.rx
                        .items(
                            cellIdentifier: CategoryCollectionViewCell.identifier,
                            cellType: CategoryCollectionViewCell.self)
                ) { index, recommend, cell in
                    
                    print("잠입 성공")
                    cell.layout()
                    let item = self.getCategoryList?.content[index]
                    cell.forceLoadData(item!.categoryName)
                    cell.configure(with: self.getCategoryList!, index)
                    cell.imageView.image = UIImage(named: "CateforyCollectionViewCell")
                    cell.layer.cornerRadius = 10
                }
        })
    }
    
    private func attribute() {
        
        view.backgroundColor = .black
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    private func layout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(30.0)
            $0.bottom.equalToSuperview()
        }
    }
}
