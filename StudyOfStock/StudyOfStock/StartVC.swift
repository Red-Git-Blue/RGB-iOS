//
//  ViewController.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/19.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "MainBackground"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    private lazy var mainLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .semibold)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mainSignUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .semibold)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
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
        
        mainImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        mainLoginButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(39)
            $0.trailing.equalToSuperview().inset(39)
            $0.bottom.equalToSuperview().inset(350)
            $0.height.equalTo(60)
        }
        
        mainSignUpButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(39)
            $0.trailing.equalToSuperview().inset(39)
            $0.bottom.equalTo(mainLoginButton.snp.bottom).offset(90)
            $0.height.equalTo(60)
        }
    }
    
    @objc func didTapLoginButton() {
        let goToMainLoginVC = LoginBgViewController()
        goToMainLoginVC.modalPresentationStyle = .fullScreen
        self.present(goToMainLoginVC, animated: true, completion: nil)
    }
}
