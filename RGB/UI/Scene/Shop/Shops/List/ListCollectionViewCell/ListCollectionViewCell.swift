import Foundation
import Then
import SnapKit
import Kingfisher

// Cell
class ListCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "ListCollectionViewCell"
    
    var imageView = UIImageView().then {
        
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
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
        self.addSubview(imageView)
        
        imageView.contentMode = .scaleToFill
        imageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configure(with badgeImage: GetAllBadgesListModel,_ index: Int) {
        let imageURL = URL(string: "\(badgeImage.content[index].badgeMainFile.fileURL)")
        imageView.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "RGBLogo"))
    }
}
