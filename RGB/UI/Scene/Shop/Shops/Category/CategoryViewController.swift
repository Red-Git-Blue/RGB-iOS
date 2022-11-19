import UIKit

class CategoryViewController: BaseAbstractShop {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    override func viewIndex() -> Int {
        return 1
    }
}
