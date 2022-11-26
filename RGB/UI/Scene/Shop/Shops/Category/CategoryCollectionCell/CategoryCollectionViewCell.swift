import Foundation
import Then
import SnapKit

// Cell
class CategoryCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "cell3"
    
    var img = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    
    var label = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "label label"
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
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(15.0)
            $0.centerX.equalToSuperview()
        }
    }
}
