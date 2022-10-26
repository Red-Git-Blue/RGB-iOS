//
//  PasswordCompletionView.swift
//  RGB
//
//  Created by 박준하 on 2022/10/26.
//
import Then
import UIKit
import SnapKit

class PasswordCompletionView : BaseCompletionView {
    
    internal lazy var LoginButton = UIButton().then {
        let image = UIImage(named: "LoginButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        firstLargeLabel.text = "비밀번호를\n찾았습니다."
        secondRegularLabel.text = "당신의 비밀번호는"
        sendButton.setTitle("여기다가 온 email 적어주세요", for: .normal)
        
        [
            LoginButton
        ].forEach { controller.view.addSubview($0) }
        
        LoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(80.0)
            $0.centerX.equalTo(controller.view)
            $0.height.equalTo(50.0)
            $0.width.equalTo(390.0)
        }
    }
}
