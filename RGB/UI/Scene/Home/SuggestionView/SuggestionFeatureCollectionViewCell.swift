import SnapKit
import UIKit

final class SuggestionFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 75.0 }

    private lazy var imageView = UIImageView().then {
        $0.backgroundColor = .tertiarySystemGroupedBackground
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
        //        옆에 imageview 테두리 만들기
        //        imageView.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 20
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
        $0.font = .systemFont(ofSize: 14.0, weight: .bold)
        $0.textColor = .white
    }

    private var inDecreaseLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 12.0, weight: .semibold)
        $0.textColor = .red
    }

    func setup() {
        setupLayout()

        titleLabel.text = "PEACH&NIGA"
        descriptionLabel.text = "027849"
        inDecreaseLabel.text = "+12.8%"
        coinPriceLabel.text = "23,904"
    }

}

// MARK: Private
private extension SuggestionFeatureCollectionViewCell {
    func setupLayout() {
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
            $0.width.equalTo(imageView.snp.height)
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
            $0.top.equalTo(coinPriceLabel.snp.bottom).offset(3.0)
        }
    }
}
