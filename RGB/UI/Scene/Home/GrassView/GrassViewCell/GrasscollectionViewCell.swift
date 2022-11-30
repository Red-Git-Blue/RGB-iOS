import SnapKit
import UIKit
import PContributionsView

final class GrasscollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 75.0 }
    
    private lazy var mainGrassView = PContributionsView().then {
        $0.backgroundColor = .clear
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.text = "September"
        $0.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.textColor = .red
    }
    
    private lazy var commitLabel = UILabel().then {
        $0.text = "32 Commit"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .green
    }

    func setup(data: [[Int]]) {
        setupLayout()
        
        mainGrassView.contrilbutionsData = data
        mainGrassView.cellCornerRadius(4)
        mainGrassView.spacing = 2
    }
}

// MARK: Private
private extension GrasscollectionViewCell {
    func setupLayout() {
        [
            dateLabel,
            mainGrassView,
            commitLabel
        ].forEach { addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        commitLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(14.0)
            $0.leading.equalToSuperview().inset(30.0)
        }

        mainGrassView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            
            $0.width.equalTo(120.0)
            $0.height.equalTo(128.0)
        }
    }
}
