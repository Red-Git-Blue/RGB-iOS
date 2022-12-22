import SnapKit
import Then
import UIKit
import Kingfisher

final class BadgesCell: UICollectionViewCell {
    
    static let identifier = "NewBadgesCollectionViewCell"
    
    static var height: CGFloat { 310.0 }
    static var width: CGFloat { 220.0 }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(named: "CollectionViewColor")
        imageView.layer.cornerRadius = 20.0

        return imageView
    }()
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
        $0.text = "고급스러운 무의 배지"
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.text = "고급스러운 색감과 무의 예술적인 \n감각을 살린 배지"
    }

    private lazy var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.textColor = .white
        $0.text = "12,000원"
    }
    
    func configure(with badgeImage: GetBadgeListModel,_ index: Int) {
        let imageURL = URL(string: "\(badgeImage.content[index].badgeMainFile.fileURL)")
        imageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "RGBLogo"))
    }

    func setup() {
        
//        imageView.image = imageData.image
//        imageView.tintColor = imageData.tintColor
//        titleLabel.text = titleData.text
//        descriptionLabel.text = descriptionData.text
//        coinPriceLabel.text = coinPriceData.text
        setupLayout()
    }
}

// MARK: Private
private extension BadgesCell {
    func setupLayout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(220.0)
            $0.width.equalTo(220.0)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(15.0)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.0)
        }
        coinPriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
