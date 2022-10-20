//
//  MainSignupVC.swift
//  RGB
//
//  Created by 박준하 on 2022/10/18.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

class MainSignupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("SignCustom")
            let SignCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 1000
            }
            sheetPresentationController.detents = [SignCustomDetent]
        }
        print("ㅗㅗㅗㅗㅗㅗ")
        self.isModalInPresentation = true
        let opacity = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let opacityView = UIVisualEffectView(effect: opacity)
        opacityView.frame = view.bounds
        opacityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(opacityView)
    }
    
}
