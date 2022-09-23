//
//  dddd.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit

class FadeAwayPresentationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .custom
        segue.destination.transitioningDelegate = self
    }
    

}


extension FadeAwayPresentationViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return FadeAwayPresentation(presentedViewController: presented, presenting: presenting)
    }
}
