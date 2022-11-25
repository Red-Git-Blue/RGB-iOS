//
//  ControllerManager.swift
//  RGB
//
//  Created by 박준하 on 2022/11/18.
//

import UIKit

extension UIViewController {
    func presentView(_ view: UIViewController,_ animation: Bool) {
        self.navigationController?.pushViewController(view, animated: animation)
        self.navigationController?.viewControllers.remove(at: (self.navigationController?.viewControllers.count)! - 2)
    }
}
