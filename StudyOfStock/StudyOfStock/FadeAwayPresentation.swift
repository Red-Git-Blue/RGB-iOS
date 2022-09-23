//
//  TextSViewContoller.swift
//  StudyOfStock
//
//  Created by 박준하 on 2022/09/23.
//

import UIKit
import SnapKit
class FadeAwayPresentation: UIPresentationController {
    
    let dimmingView: UIVisualEffectView = {
        var view = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let closeButtoun: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let dummyView = UIView()
    var closeButtonTopConstraint: NSLayoutConstraint?
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        closeButtoun.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    @objc func dismissAction() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard var frame = containerView?.frame else { fatalError() }
        frame.origin.y = frame.size.height / 2
        frame.size.height = frame.size.height / 2
        return frame
    }
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let containerView = containerView else { fatalError() }
        
        containerView.insertSubview(dimmingView, at: 0)
        containerView.addSubview(dummyView)
        containerView.addSubview(closeButtoun)
        
        dimmingView.frame = containerView.frame
        dimmingView.alpha = 0.0
        dummyView.frame = dimmingView.frame
        
        closeButtoun.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        closeButtonTopConstraint = closeButtoun.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -80)
        closeButtonTopConstraint?.isActive = true
        
        containerView.layoutIfNeeded()
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            closeButtonTopConstraint?.constant = 60
            dimmingView.alpha = 1.0
            presentingViewController.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            return
        }
        coordinator.animate(alongsideTransition: { (animation) in
            self.closeButtonTopConstraint?.constant = 60
            self.dimmingView.alpha = 1.0
            self.presentingViewController.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            containerView.layoutIfNeeded()
        }, completion: nil)
        
    }
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        guard let coordinator = presentingViewController.transitionCoordinator else {
            closeButtonTopConstraint?.constant = -80
            dimmingView.alpha = 0.0
            presentingViewController.view.transform = CGAffineTransform.identity
            containerView?.layoutIfNeeded()
            return
        }
        coordinator.animate(alongsideTransition: { (animator) in
            self.closeButtonTopConstraint?.constant = -80
            self.dimmingView.alpha = 0.0
            self.presentingViewController.view.transform = CGAffineTransform.identity
            self.containerView?.layoutIfNeeded()
        }, completion: nil)
    }
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        dimmingView.frame = containerView!.frame
    }
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        presentingViewController.view.transform = CGAffineTransform.identity
        coordinator.animate(alongsideTransition: { (ani) in
            self.presentingViewController.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
}
