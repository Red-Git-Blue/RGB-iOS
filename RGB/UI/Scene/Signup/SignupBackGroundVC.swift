import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignupBackGroundViewController: UIViewController {
    
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

extension SignupBackGroundViewController {
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

extension SignupBackGroundViewController {
    
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

            let SignupViewContoller = SignupViewController()
            self.present(SignupViewContoller, animated: true)
        }
    }
}
