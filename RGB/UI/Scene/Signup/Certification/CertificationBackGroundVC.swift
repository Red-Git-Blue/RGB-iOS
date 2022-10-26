//
//  CertificationBGVC.swift
//  RGB
//
//  Created by 박준하 on 2022/10/26.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CertificationBackGroundViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    private lazy var mainImageView: UIImageView = {
        let imageName = "BackGroundView"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SignBgViewController")
        
        setupLayout()
        upView()
//        mainImageView.layer.cornerRadius = 400
    }
}

extension CertificationBackGroundViewController {
    func setupLayout() {
        [
            mainImageView
        ].forEach { view.addSubview($0) }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }
}

extension CertificationBackGroundViewController {
    
    func upView() {
        Observable<Int>.interval(.seconds(Int(0)), scheduler: MainScheduler.instance)
            .take(0)
            .subscribe(onNext: { value in
              print(value)
            }, onError: { error in
              print(error)
            }, onCompleted: {
              print("onCompleted")
            }, onDisposed: {
              print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {

            let CertificationViewContoller = CertificationViewController()
            self.present(CertificationViewContoller, animated: true)
        }
    }
}
