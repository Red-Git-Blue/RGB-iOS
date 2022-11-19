import UIKit

class CoinSearchViewController: BaseAbstractSearch {
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }
    
    override func viewIndex() -> Int {
        return 0
    }
}
