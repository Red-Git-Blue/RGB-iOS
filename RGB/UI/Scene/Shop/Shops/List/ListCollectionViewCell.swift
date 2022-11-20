//
//  ListCell.swift
//  RGB
//
//  Created by 박준하 on 2022/11/21.
//

import Foundation
import Then
import SnapKit

// Cell
class ListCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "ListCollectionViewCell"
    
    var img = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
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
        
        img.contentMode = .scaleToFill
        img.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
