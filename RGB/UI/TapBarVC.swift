import UIKit
import Then
import SnapKit

class TapBarViewController : UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVC = UINavigationController(rootViewController: AppViewController())
        let tabOneBarItem = UITabBarItem(title: "",
                                         image: UIImage(systemName: "house"),
                                         tag: 1)
        
        homeVC.tabBarItem = tabOneBarItem
        
        let chartVC = UINavigationController(rootViewController: CoinViewController())
        let tabTwoBarItem2 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "chart.bar.fill"),
                                          tag: 2)
        
        chartVC.tabBarItem = tabTwoBarItem2
        
        let searchVC = UINavigationController(rootViewController: CoinSearchViewController())
        let tabThrBarItem3 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "magnifyingglass"),
                                          tag: 3)
        
        searchVC.tabBarItem = tabThrBarItem3
        
        let shopVC = UINavigationController(rootViewController: ShopViewController())
        let tabFouBarItem4 = UITabBarItem(title: "",
                                          image: UIImage(systemName: "cart"),
                                          tag: 4)
        
        shopVC.tabBarItem = tabFouBarItem4
        
        let userVC = UINavigationController(rootViewController: UserViewController())
        let tabFiveBarItem5 = UITabBarItem(title: "",
                                           image: UIImage(systemName: "person"),
                                           tag: 5)
        userVC.tabBarItem = tabFiveBarItem5
        
        self.tabBar.tintColor = UIColor(named: "errorColor")
        self.tabBar.unselectedItemTintColor = .white
        self.viewControllers = [homeVC, chartVC, searchVC, shopVC, userVC]
        self.tabBar.backgroundColor = UIColor(named: "CollectionViewColor")
    }
}
