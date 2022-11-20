import UIKit
import RxSwift
import RxCocoa
import CoreLocation
import Then

class ListViewController: BaseAbstractShop {
    override func viewIndex() -> Int {
        return 2
    }
    
    var array = ["first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12","first","second","third","fourth","fifth","6","7","8","9","10","11","12"]
    
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
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        
        
        data.asObservable()
            .bind(to: collectionView.rx
                    .items(
                        cellIdentifier: ListCollectionViewCell.identifier,
                        cellType: ListCollectionViewCell.self)
            ) { index, recommend, cell in
                cell.img.image = UIImage(named: "MainBage")
                cell.layer.cornerRadius = 10
            }
        
    }
}

extension ListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width : CGFloat = (collectionView.bounds.width) / 5
        
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

extension ListViewController {
    
    private func autoLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(15.0)
            $0.bottom.equalToSuperview()
        }
    }
}
