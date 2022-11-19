import UIKit

class ChartViewController: BaseAbstractChart {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewIndex() -> Int {
        return 0
    }
}
