import UIKit
import SnapKit
import Then
import Charts
import ReusableKit

class CoinDetailViewController: UIViewController {
    
    enum Reusable {
      static let tagCell = ReusableCell<TagCell>()
    }
    
    // MARK: - Property
    
    // 뿌려줄 데이터
      private var tagList: [String] = ["1일", "1주", "1달", "1년", "최대"]
    
    // MARK: - View
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
      let layout = LeftAlignedCollectionViewFlowLayout()
      layout.minimumLineSpacing = 3
      layout.minimumInteritemSpacing = 3
      layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
      
      $0.isScrollEnabled = false
      $0.collectionViewLayout = layout
      $0.backgroundColor = .systemBackground
      $0.register(Reusable.tagCell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
        title = "코인 거래"
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func loadView() {
      let view = UIView()
      view.backgroundColor = .systemBackground
      self.view = view
    }

    private lazy var imageView = UIImageView().then {
        $0.backgroundColor = .red
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 15
    }

    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }

    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }

    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 32.0, weight: .bold)
        $0.textColor = .white
    }

    private var inDecreaseLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .semibold)
        $0.textColor = .red
    }
    
    private var chartView = UIView().then {
        $0.backgroundColor = .red
    }
}

extension CoinDetailViewController: UICollectionViewDataSource {
  // cell갯수
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tagList.count
  }
  
  // cell 선언
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(Reusable.tagCell, for: indexPath)
    
    cell.tagLabel.text = tagList[indexPath.item]
    
    return cell
  }
}

extension CoinDetailViewController: UICollectionViewDelegateFlowLayout {
  // 셀 크기설정
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let label = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.text = tagList[indexPath.item]
        $0.sizeToFit()
    }
    let size = label.frame.size
    
    return CGSize(width: size.width + 16, height: size.height + 10)
  }
}


extension CoinDetailViewController {
    func bind() {
        
    }
    func attribute() {
        titleLabel.text = "junha"
        descriptionLabel.text = "박준하"
        coinPriceLabel.text = "152,894원"
        inDecreaseLabel.text = "+250원 (+2.14%)"
    }
    func layout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel,
            inDecreaseLabel,
            chartView,
            collectionView
        ].forEach { view.addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(30.0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.width.equalTo(35.0)
            $0.height.equalTo(35.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
            $0.top.equalTo(imageView.snp.top)
        }

        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
        }
        
        coinPriceLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10.0)
            $0.leading.equalTo(imageView.snp.leading)
        }
        
        inDecreaseLabel.snp.makeConstraints {
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(coinPriceLabel.snp.leading)
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(inDecreaseLabel.snp.bottom).offset(36.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200.0)
            $0.width.equalTo(430.0)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(chartView.snp.bottom).offset(20.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.width.equalToSuperview()
        }
    }
}
