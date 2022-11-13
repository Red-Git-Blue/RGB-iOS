import UIKit
import Then
import RxSwift
import SnapKit
import RxMoya
import Moya

class AdminPageViewController: UIViewController {
    
    let provider = MoyaProvider<MyAPI>()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        setupView()
        
        logoutButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                self.provider.rx.request(.deleteLogout(DeletLogout()))
                    .subscribe {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true)
                    }.disposed(by: self.disposeBag)
            })
        
        withdrawalButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                self.provider.rx.request(.deleteMemberGoOut(DeletMemberGoOut(password: PasswordSaver.saver.getSavedpassword()!)))
                    .subscribe { response in
                        switch response {
                        case .success(let response):
                            print(response.statusCode)
                            break
                        case .failure(let error):
                            print("에러: \(error)")
                        }
                    }.disposed(by: self.disposeBag)
            })
    }
    
    private lazy var modalView = UIView().then {
        $0.backgroundColor = UIColor(named: "BaseColor")
        $0.layer.cornerRadius = 20
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.text = "김관리자"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
    }
    
    private lazy var adminLabel = UILabel().then {
        $0.text = "ADMIN"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = UIColor(named: "HintColor")
    }
    
    private lazy var emailLabel = UILabel().then {
        $0.text = "krpjs0508@dsm.hs.kr"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = UIColor(named: "HintColor")
    }
    
    private lazy var passwordChageButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20.0
        $0.setTitle("비밀번호 변경", for: .normal)
        $0.setTitleColor(UIColor(named: "HintColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 280.0)
    }
    
    private lazy var autoJoinButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20.0
        $0.setTitle("종목 빈자리 자동 참여", for: .normal)
        $0.setTitleColor(UIColor(named: "HintColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 230.0)
    }
    
    private lazy var logoutButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20.0
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(UIColor(named: "HighlightColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 300.0)
    }
    
    private lazy var withdrawalButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20.0
        $0.setTitle("회원 탈퇴", for: .normal)
        $0.setTitleColor(UIColor(named: "HighlightColor"), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 300.0)
    }
    
}


extension AdminPageViewController {
    func setupView() {
        [
            modalView,
            nameLabel,
            adminLabel,
            emailLabel,
            passwordChageButton,
            autoJoinButton,
            logoutButton,
            withdrawalButton
        ].forEach { view.addSubview($0)}
                
        let buttonHeight = 48.0
        let buttonWidth = 398.0
        
        let width = view.frame.width / 430.0
        let height = view.frame.height / 932.0
        
        modalView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(170.0)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(modalView.snp.top).offset(24.0)
            $0.leading.equalToSuperview().offset(28.0)
        }
        
        adminLabel.snp.makeConstraints {
            $0.top.equalTo(modalView.snp.top).offset(31.0)
            $0.leading.equalTo(nameLabel.snp.leading).inset(72.0)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        passwordChageButton.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(buttonHeight * height)
            $0.width.equalTo(buttonWidth * width)
        }
        
        autoJoinButton.snp.makeConstraints {
            $0.top.equalTo(passwordChageButton.snp.bottom).offset(12.0)
            $0.leading.equalTo(passwordChageButton.snp.leading)
            $0.height.equalTo(buttonHeight * height)
            $0.width.equalTo(buttonWidth * width)
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(autoJoinButton.snp.bottom).offset(12.0)
            $0.leading.equalTo(passwordChageButton.snp.leading)
            $0.height.equalTo(buttonHeight * height)
            $0.width.equalTo(buttonWidth * width)
        }
        
        withdrawalButton.snp.makeConstraints {
            $0.top.equalTo(logoutButton.snp.bottom).offset(12.0)
            $0.leading.equalTo(passwordChageButton.snp.leading)
            $0.height.equalTo(buttonHeight * height)
            $0.width.equalTo(buttonWidth * width)
        }
    }
}
