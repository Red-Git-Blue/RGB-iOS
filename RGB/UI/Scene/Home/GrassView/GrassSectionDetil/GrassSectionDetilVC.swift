import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import PContributionsView

class GrassSectionDetilViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private lazy var stackView = UIStackView().then { stackView in
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
    }
    
    var disposeBag = DisposeBag()
    
    var grassSection: GrassSectionModel?
    
    private var data: [[Int]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
        for _ in 0...3 {
            appendGrassDate()
        }
        
        downButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                print("💠downButton")
                self!.dismiss(animated: true, completion: nil)
            })
            .dispose()
            
    }
    
    private lazy var mainGrassView = PContributionsView().then {
        $0.backgroundColor = .clear
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
    
    internal lazy var divisionLine = UIView().then {
        $0.backgroundColor = .secondaryLabel
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
            divisionLine
            
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
        
        divisionLine.snp.makeConstraints {
            $0.top.equalTo(userAverageCommit.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(3)
            $0.width.equalTo(370.0)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(divisionLine.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func appendGrassDate() {
        let grassSectionDateView = GrassSectionDateView(frame: .zero, viewController: self)
        
        grassSectionDateView.updateData(grassSection!)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(250.0)
        }
        
        let spacingView2 = UIView()
        spacingView2.snp.makeConstraints {
            $0.height.equalTo(250.0)
        }
        
        [
            grassSectionDateView,
            spacingView
        ].forEach {
            stackView.addArrangedSubview($0)
        }
    }
}
