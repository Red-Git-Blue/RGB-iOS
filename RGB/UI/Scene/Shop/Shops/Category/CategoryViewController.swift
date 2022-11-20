import UIKit
import RxSwift
import RxCocoa
import CoreLocation
import Then

class CategoryViewController: BaseAbstractShop {
    
    override func viewIndex() -> Int {
        return 1
    }
    
    var array = ["first","second","third","fourth","fifth","6","7","8","9","10","11","12"]
    
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
        
        let data = Observable<[String]>.of(self.array)
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        autoLayout()
        collectionView.register(CateforyCollectionViewCell.self, forCellWithReuseIdentifier: CateforyCollectionViewCell.identifier)
        
        
        data.asObservable()
            .bind(to: collectionView.rx
                    .items(
                        cellIdentifier: CateforyCollectionViewCell.identifier,
                        cellType: CateforyCollectionViewCell.self)
            ) { index, recommend, cell in
                cell.img.image = UIImage(named: "CateforyCollectionViewCell")
                cell.label.text = "index \(index)"
                cell.layer.cornerRadius = 10
            }
        
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
    
    private func autoLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(30.0)
            $0.bottom.equalToSuperview()
        }
    }
}
