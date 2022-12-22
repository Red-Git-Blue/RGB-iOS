import UIKit
import SnapKit
import Then

class AdvertisementCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AdvertisementCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0

        return imageView
    }()
    
    func configure(with advertiseImage: GetAdvertiseNowModel,_ index: Int) {
        let imageURL = URL(string: "\(advertiseImage.content[index].advertiseFile.fileURL)")
        imageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "RGBLogo"))
    }
    
    func setupLayout() {
        [
            imageView
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
