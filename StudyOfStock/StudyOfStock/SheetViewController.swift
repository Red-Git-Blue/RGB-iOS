//
//  SheetViewController.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit
import Foundation

//class SheetViewController: UIViewController, UIViewControllerTransitioningDelegate {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .systemCyan
//        modalPresentationStyle = .custom
//        transitioningDelegate = self
//    }
//    
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//        
//        let controller: UISheetPresentationController = .init(presentedViewController: presented, presenting: presenting)
//        
//        let detent1: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test1", constant: 100.0)
//        let detent2: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test2", constant: 200.0)
//        let detent3: UISheetPresentationController.Detent = ._detent(withIdentifier: "Test3", constant: 300.0)
//        
//        controller.detents = [detent1, detent2, detent3, .medium(), .large()]
//        controller.prefersGrabberVisible = true
//        
//        return controller
//    }
//}
