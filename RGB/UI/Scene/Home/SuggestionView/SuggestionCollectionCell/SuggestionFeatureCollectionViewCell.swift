import SnapKit
import UIKit

 class SuggestionFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 75.0 }
    
    static let identifier = "SuggestionFeatureCollectionViewCell"

    var imageView = UIImageView().then {
        $0.backgroundColor = .red
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 15
    }

    var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .label
        $0.numberOfLines = 2
    }

    var descriptionLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .secondaryLabel
    }

    var coinPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
    }

    var inDecreaseLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .red
    }
    
    func configure(with userImage: GetCoinUserListModel,_ index: Int) {
        let imageURL = URL(string: "\(userImage.content[index].imageURL)")
        imageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "RGBLogo"))
    }
    
    func forceLoadData(_ nicknameData: String, _ nameData: String, _ coinData: Int, _ incrementDara: String) {
        titleLabel.text = nicknameData
        descriptionLabel.text = nameData
        descriptionLabel.lineBreakMode = .byCharWrapping
        coinPriceLabel.text = "\(coinData.toDigitString())원"
        inDecreaseLabel.text = incrementDara
    }
    
    
    func attribute() {
        titleLabel.text = "jjunhaa0211"
        descriptionLabel.text = "027849"
        inDecreaseLabel.text = "+12.8%"
        coinPriceLabel.text = "23,904"
    }
    
    func layout() {
        [
            imageView,
            titleLabel,
            descriptionLabel,
            coinPriceLabel,
            inDecreaseLabel
        ].forEach { addSubview($0) }

        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(22.0)
            $0.bottom.equalToSuperview().inset(20.0)
            $0.width.equalTo(35.0)
            $0.height.equalTo(35.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10.0)
            $0.trailing.equalTo(coinPriceLabel.snp.leading)
            $0.top.equalTo(imageView.snp.top)
        }

        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5.0)
        }

        coinPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15.0)
            $0.trailing.equalToSuperview().inset(20.0)
            $0.height.equalTo(24.0)
            $0.width.equalTo(50.0)
        }

        inDecreaseLabel.snp.makeConstraints {
            $0.centerX.equalTo(coinPriceLabel.snp.centerX).inset(10.0)
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(4.0)
        }
    }
}
