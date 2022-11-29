import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import PContributionsView

class GrassSectionDetilViewController: UIViewController {
    
    var grassSection: GrassSectionModel?
    
    var disposeBag = DisposeBag()
    
    private var data: [[Int]] = []
    
    private lazy var mainGrassView = PContributionsView().then {
        $0.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
        mainGrassView.spacing = 5
        mainGrassView.cellCornerRadius(5.0)
    }
    
    public func updateData(_ section: GrassSectionModel) {
        grassSection = section
        
        var list = [[Int]]()
        var tmpList = [Int]()
        
        for i in 0...grassSection!.contributions.count - 1 {
            tmpList.append(grassSection!.contributions[i].level)
            if(i % 5 == 4) {
                list.append(tmpList)
                tmpList = [Int]()
            }
        }
        
        mainGrassView.contrilbutionsData = list
    }
    
    internal lazy var downButton = UIButton().then {
        let image = UIImage(named: "downButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
        $0.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("💠downButton")
                self!.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    internal lazy var titleLabel = UILabel().then {
        $0.text = "커밋 현황"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
    
    internal lazy var averageCommit = UILabel().then {
        $0.text = "올해의 커밋 현황"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .white
    }
    
    internal lazy var userAverageCommit = UILabel().then {
        $0.text = "140 Commit (상위 21%)"
        $0.font = .systemFont(ofSize: 16.0, weight: .regular)
        $0.textColor = .white
    }
    
    internal lazy var grassBackgroundView = UIView().then {
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 10
    }
    
    internal lazy var monLabel = UILabel().then {
        $0.text = "Mon"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .secondaryLabel
    }
    
    internal lazy var wedLabel = UILabel().then {
        $0.text = "Wed"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .secondaryLabel
    }
    
    internal lazy var friLabel = UILabel().then {
        $0.text = "Fri"
        $0.font = .systemFont(ofSize: 14.0, weight: .regular)
        $0.textColor = .secondaryLabel
    }
}

extension GrassSectionDetilViewController {
    
    func attribute() {
        view.backgroundColor = .systemBackground
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("DetailCustom")
            let DetailCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 780
            }
            sheetPresentationController.detents = [DetailCustomDetent]
            self.isModalInPresentation = true
        }
    }
    
    func layout() {
        [
            downButton,
            titleLabel,
            averageCommit,
            userAverageCommit,
            grassBackgroundView,
            monLabel,
            wedLabel,
            friLabel,
            mainGrassView
            
        ].forEach { view.addSubview($0) }
        
        let buttonSize = 24
        
        downButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28.0)
            $0.leading.equalToSuperview().offset(30.0)
            $0.height.equalTo(buttonSize)
            $0.width.equalTo(buttonSize)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(downButton.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        averageCommit.snp.makeConstraints {
            $0.top.equalTo(downButton.snp.bottom).offset(28.0)
            $0.leading.equalTo(downButton.snp.leading)
        }
        
        userAverageCommit.snp.makeConstraints {
            $0.top.equalTo(averageCommit.snp.bottom).offset(13.0)
            $0.leading.equalTo(downButton.snp.leading)
        }
        
        grassBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(192)
            $0.trailing.equalToSuperview().inset(30.0)
            $0.height.equalTo(202)
            $0.width.equalTo(208)
        }
        
        monLabel.snp.makeConstraints {
            $0.leading.equalTo(grassBackgroundView.snp.leading).inset(20.0)
            $0.top.equalTo(grassBackgroundView.snp.top).offset(56.0)
        }
        
        wedLabel.snp.makeConstraints {
            $0.top.equalTo(monLabel.snp.bottom).offset(30.0)
            $0.leading.equalTo(monLabel.snp.leading)
        }
        
        friLabel.snp.makeConstraints {
            $0.top.equalTo(wedLabel.snp.bottom).offset(35.0)
            $0.leading.equalTo(wedLabel.snp.leading)
        }
        
        mainGrassView.snp.makeConstraints {
            
            $0.height.equalTo(182)
            $0.width.equalTo(188)
            $0.top.equalTo(grassBackgroundView.snp.top).offset(10.0)
            $0.trailing.equalToSuperview().inset(5.0)
        }
    }
}
