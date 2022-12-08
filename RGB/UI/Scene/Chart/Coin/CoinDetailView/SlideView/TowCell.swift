//
//  TowCell.swift
//  RGB
//
//  Created by 박준하 on 2022/12/08.
//

import UIKit
import SnapKit
import Then

final class TowCell: UICollectionViewCell {
    // MARK: Constants
    static var id = "TowCell"
    static var color: UIColor = .red
    
    // MARK: UI
    private var imageView = UIImageView().then {
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = color
    }
    
    // MARK: Initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            imageView
        ].forEach { self.addSubview($0)}
        
        self.imageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
