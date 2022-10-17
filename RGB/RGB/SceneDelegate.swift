//
//  SceneDelegate.swift
//  RGB
//
//  Created by 박준하 on 2022/10/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = SignViewController()
            window?.makeKeyAndVisible()
    }
}
