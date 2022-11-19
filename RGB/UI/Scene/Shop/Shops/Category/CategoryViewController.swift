import UIKit
import RxSwift
import RxCocoa
import CoreLocation
import Then

// Cell
class MyCollectionViewCell3 : UICollectionViewCell {
    
    static let identifier = "cell3"
    
    var img = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "testImage")
    }
    
    var label = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "상어상어"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetting() {
        self.backgroundColor = .gray
        self.addSubview(img)
        self.addSubview(label)
        
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(0)
            $0.bottom.equalTo(-20)
        }
        label.snp.makeConstraints {
//            $0.leading.bottom.trailing.equalTo(0)
//            $0.top.equalTo(img.snp.bottom)
            $0.top.equalTo(img.snp.bottom)
        }
    }
}

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
        collectionView.register(MyCollectionViewCell3.self, forCellWithReuseIdentifier: MyCollectionViewCell3.identifier)
        
        
        data.asObservable()
            .bind(to: collectionView.rx
                    .items(
                        cellIdentifier: MyCollectionViewCell3.identifier,
                        cellType: MyCollectionViewCell3.self)
            ) { index, recommend, cell in
                cell.img.image = UIImage(named: "testImage")
                cell.label.text = "index \(index)"
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
