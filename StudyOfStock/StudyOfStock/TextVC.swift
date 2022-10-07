//
//  TextVC.swift
//  Pods
//
//  Created by 박준하 on 2022/10/05.
//

import UIKit
import SnapKit

final class TextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        gotoSignUpButton.backgroundColor = .red
    }
    
    private lazy var gotoSignUpButton = UIButton().then {
        let image = UIImage(named: "SignupTextImage")
        $0.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
}

extension TextViewController {
    func setup() {
        [
            gotoSignUpButton
        ].forEach { view.addSubview($0) }
        
        gotoSignUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(50)
            $0.width.equalTo(430)
        }
    }
}
