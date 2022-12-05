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
    contentView.layer.cornerRadius = 15
    
    setConstraint()
  }
    
    public func unselect() {
        tagLabel.textColor = .gray
        contentView.backgroundColor = .systemGray5
    }
    
    public func select() {
        tagLabel.textColor = UIColor.black
        contentView.backgroundColor = .white
    }
    
    var clickCount: Int = 0 {
        didSet {
            if clickCount == 0 {
                tagLabel.textColor = UIColor.black
            }
            else {
                tagLabel.textColor = UIColor.systemGray5
            }
        }
    }
    
    // 중복 클릭을 허용하지 않기 때문에 isSelected를 체크해서 최근에 클릭된 버튼만 빨간색으로 변경
    override var isSelected: Bool {
        didSet {
            if !isSelected {
                tagLabel.textColor = UIColor.red
                clickCount = 0
            }
        }
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
