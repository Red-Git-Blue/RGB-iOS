//
//  LoginVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/21.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
//    let font = SosFont.getFont()
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "LoginView"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var sosLogo: UIImageView = {
        let imageLogo = "SOSLogo"
        let image = UIImage(named: imageLogo)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var notMember: UILabel = {
        var label = UILabel()
//        label.font = font.smallFont
        label.text = "로그인"
        
       return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

extension LoginViewController {
    func setupLayout() {
        [
            mainImageView,
            sosLogo,
            notMember
        ].forEach { view.addSubview($0) }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        sosLogo.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(70)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
        }
        
        notMember.snp.makeConstraints {
            $0.top.equalTo(sosLogo.snp.top).offset(50)
        }
    }
}
