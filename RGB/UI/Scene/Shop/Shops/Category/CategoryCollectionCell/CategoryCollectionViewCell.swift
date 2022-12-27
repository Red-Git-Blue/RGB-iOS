import Foundation
import Then
import SnapKit

// Cell
class CategoryCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    var imageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    
    var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "label label"
    }
    
    func configure(with categoryImage: GetCategoryListModel,_ index: Int) {
        let imageURL = URL(string: "\(categoryImage.content[index].categoryIcon.fileURL)")
        imageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "RGBLogo"))
    }
    
    func forceLoadData(_ titleData: String) {
        titleLabel.text = titleData
    }
    
    
    func layout() {
        self.backgroundColor = .gray
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(15.0)
            $0.centerX.equalToSuperview()
        }
    }
}
