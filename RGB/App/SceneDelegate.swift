import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.windowScene = windowScene
        
//        let homeViewController = AppViewController()
        let loginViewController = StartViewController()
//        let tapbarViewController = TapBarViewController()
        let rootNavigationController = UINavigationController(rootViewController: loginViewController)
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
}
