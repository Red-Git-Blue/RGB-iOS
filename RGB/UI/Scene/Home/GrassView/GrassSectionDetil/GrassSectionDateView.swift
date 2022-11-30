import SnapKit
import Then
import UIKit
import PContributionsView

final class GrassSectionDateView: UIView {
    private final var controller: UIViewController
    
    var grassSection: GrassSectionModel?
    
    private lazy var mainGrassView = PContributionsView().then {
        $0.backgroundColor = .clear
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
    
    
    init(frame: CGRect, viewController: UIViewController) {
        controller = viewController
        super.init(frame: frame)
        layout()
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}

private extension GrassSectionDateView {
    
    func bind(_ viewModel: UserGraphListSectionViewModel) {
        
    }
    
    func attribute() {
        mainGrassView.spacing = 5
        mainGrassView.cellCornerRadius(5.0)
    }
    
    func layout() {
        [
            grassBackgroundView,
            monLabel,
            wedLabel,
            friLabel,
            mainGrassView
        ].forEach { self.addSubview($0) }
        
        grassBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(192)
            $0.trailing.equalToSuperview().inset(30.0)
            $0.height.equalTo(202)
            $0.width.equalTo(208)
        }
        
        monLabel.snp.makeConstraints {
            $0.leading.equalTo(grassBackgroundView.snp.leading).inset(20.0)
            $0.top.equalTo(grassBackgroundView.snp.top).offset(50.0)
        }
        
        wedLabel.snp.makeConstraints {
            $0.top.equalTo(monLabel.snp.bottom).offset(25.0)
            $0.leading.equalTo(monLabel.snp.leading)
        }
        
        friLabel.snp.makeConstraints {
            $0.top.equalTo(wedLabel.snp.bottom).offset(25.0)
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

