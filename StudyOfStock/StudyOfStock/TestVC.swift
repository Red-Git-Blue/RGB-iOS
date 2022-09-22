//
//  testVC.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit

class TestViewContoller: UIViewController {
    
    override func viewDidLoad() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .medium
            sheetPresentationController.detents = [.medium(), .large()]
            
            view.backgroundColor = .red
        }
    }
}


