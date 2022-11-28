import SnapKit
import UIKit
import PContributionsView

final class GrasscollectionViewCell: UICollectionViewCell {
    static var height: CGFloat { 75.0 }
    
    private lazy var mainGrassView = PContributionsView().then {
        $0.backgroundColor = .clear
    }

    func setup(data: [[Int]]) {
        setupLayout()
        
        mainGrassView.contrilbutionsData = data
        mainGrassView.userCustomColor(ColorMap("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF"))
        mainGrassView.cellCornerRadius(4)
        mainGrassView.spacing = 2
    }
}

// MARK: Private
private extension GrasscollectionViewCell {
    func setupLayout() {
        [
            mainGrassView
        ].forEach { addSubview($0) }

        mainGrassView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            
            $0.width.equalTo(120.0)
            $0.height.equalTo(128.0)
        }
    }
}
