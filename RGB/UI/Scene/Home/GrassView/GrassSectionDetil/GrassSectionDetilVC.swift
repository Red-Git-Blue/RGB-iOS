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
        $0.backgroundColor = .systemPink
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
        mainGrassView.userCustomColor(ColorMap("#F4F4F4", "#72FFFF", "#00D7FF", "#0096FF", "#5800FF"))
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
        
        mainGrassView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(202)
            $0.width.equalTo(208)
        }
    }
}
