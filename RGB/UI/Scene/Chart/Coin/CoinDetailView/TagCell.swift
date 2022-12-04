//
//  TagCell.swift
//  RGB
//
//  Created by 박준하 on 2022/12/04.
//

import UIKit
import Then
import SnapKit

class TagCell: UICollectionViewCell {
  
  // MARK: - View
  
  let tagLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.textColor = .gray
  }
  
  // MARK: - layout
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(tagLabel)
    contentView.backgroundColor = .systemGray5
    contentView.layer.masksToBounds = true
    contentView.layer.cornerRadius = 4
    
    setConstraint()
  }
  
  func setConstraint() {
    tagLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
