import UIKit

class ListViewController: BaseAbstractShop {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewIndex() -> Int {
        return 2
    }
}
