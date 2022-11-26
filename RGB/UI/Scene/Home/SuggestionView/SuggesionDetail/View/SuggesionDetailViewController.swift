import UIKit
import Then
import SnapKit
import RxSwift

class SuggesionDetailViewController: UIViewController {
    
    var suggestion: SuggesionModel?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
    }
    
    internal lazy var downButton = UIButton().then {
        let image = UIImage(named: "downButton")
        $0.setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    internal lazy var titleLabel = UILabel().then {
        $0.text = "추천 코인"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .label
    }
}


extension SuggesionDetailViewController {
    
    func bind(_ viewModel: SuggesionDetailViewModel) {
        downButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("💠downButton")
                self!.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
    
    func attribute() {
        view.backgroundColor = .systemBackground
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.largestUndimmedDetentIdentifier = .large
            let id = UISheetPresentationController.Detent.Identifier("DetailCustom")
            let DetailCustomDetent = UISheetPresentationController.Detent.custom(identifier: id) { context in
                return 730
            }
            sheetPresentationController.detents = [DetailCustomDetent]
            self.isModalInPresentation = true
        }
    }
    
    func layout() {
        [
            downButton,
            titleLabel
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
    }
}
