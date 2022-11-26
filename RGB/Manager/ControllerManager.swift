import UIKit

extension UIViewController {
    func presentView(_ view: UIViewController,_ animation: Bool) {
        self.navigationController?.pushViewController(view, animated: animation)
        self.navigationController?.viewControllers.remove(at: (self.navigationController?.viewControllers.count)! - 2)
    }
}
