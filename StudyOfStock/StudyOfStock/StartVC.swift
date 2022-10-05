//
//  ViewController.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/19.
//

import UIKit
import SnapKit
import Then

class StartViewController: UIViewController {
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "MainBackground"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var mainLoginButton = UIButton().then {
        let image = UIImage(named: "mainLogin")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    private lazy var mainSignUpButton = UIButton().then {
        let image = UIImage(named: "mainSign")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.addTarget(self, action: #selector(didTapSignButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

private extension StartViewController {
    func setupLayout() {
        [
            mainImageView,
            mainLoginButton,
            mainSignUpButton
        ].forEach { view.addSubview($0) }
        
        let width = view.frame.width / 430
        let height = view.frame.height / 932
        
        mainImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        mainLoginButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(39 * width)
            $0.trailing.equalToSuperview().inset(39 * width)
            $0.bottom.equalToSuperview().inset(350 * height)
            $0.height.equalTo(60 * height)
        }
        
        mainSignUpButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(39 * width)
            $0.trailing.equalToSuperview().inset(39 * width)
            $0.bottom.equalTo(mainLoginButton.snp.bottom).offset(80 * height)
            $0.height.equalTo(55 * height)
        }
    }
    
    @objc func didTapLoginButton() {
        let goToMainLoginVC = LoginBackgroundViewController()
        goToMainLoginVC.modalPresentationStyle = .fullScreen
        self.present(goToMainLoginVC, animated: true, completion: nil)
    }
    
    @objc func didTapSignButton(){
        let goToMainSignupVC = SignBackgroundViewController()
        goToMainSignupVC.modalPresentationStyle = .fullScreen
        self.present(goToMainSignupVC, animated: true, completion: nil)
    }
}
