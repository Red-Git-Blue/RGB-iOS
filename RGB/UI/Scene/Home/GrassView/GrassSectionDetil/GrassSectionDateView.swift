import SnapKit
import Then
import UIKit
import PContributionsView

final class GrassSectionDateView: UIView {
    private static var months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
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
    
    internal lazy var dateLabel = UILabel().then {
        $0.text = "September"
        $0.font = .systemFont(ofSize: 20.0, weight: .bold)
        $0.textColor = .white
    }
    
    internal lazy var userCommitLabel = UILabel().then {
        $0.text = "32 Commit"
        $0.font = .systemFont(ofSize: 16.0, weight: .regular)
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
    
    public func updateData(_ section: GrassSectionModel,_ month: Int) {
        grassSection = section
        
        dateLabel.text = GrassSectionDateView.months[month]
        
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
            mainGrassView,
            dateLabel,
            userCommitLabel
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
        
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(grassBackgroundView.snp.top)
            $0.leading.equalToSuperview().inset(30.0)
        }
        
        userCommitLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(10.0)
            $0.leading.equalTo(dateLabel.snp.leading)
        }
    }
}

