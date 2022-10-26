//
//  PasswordCompletionVC.swift
//  RGB
//
//  Created by 박준하 on 2022/10/26.
//

import UIKit

class PasswordCompletionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("SignCustom")
            let SignCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 800
            }
            sheetPresentationController.detents = [SignCustomDetent]
        }
        self.isModalInPresentation = true
        let opacity = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let opacityView = UIVisualEffectView(effect: opacity)
        opacityView.frame = view.bounds
        opacityView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(opacityView)

        let view = PasswordCompletionView()
        
        view.updateWith(self)
    }
}
