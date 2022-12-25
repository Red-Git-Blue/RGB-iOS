//
//  GrassGatchaView.swift
//  RGB
//
//  Created by 박준하 on 2022/11/28.
//

import UIKit
import SnapKit
import Then

class GrassGatchaView: UIView {
    private final var controller: UIViewController
    
//    private lazy var grassView = UIImageView().then { _ in
//        let imageName = "grassGatchaImage"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//    }
//
    let grassView : UIImageView = { // 이미지 생성
        let imgView = UIImageView()
        imgView.image = UIImage(named: "grassGatchaImage")
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension GrassGatchaView {
    
    func attribute() {
        grassView.layer.cornerRadius = 20.0
    }
    
    func layout() {
        [
            grassView
        ].forEach { self.addSubview($0) }
        
        grassView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(220.0)
        }
    }
}
