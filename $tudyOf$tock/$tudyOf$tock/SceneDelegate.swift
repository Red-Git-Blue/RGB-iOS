//
//  SceneDelegate.swift
//  $tudyOf$tock
//
//  Created by 박준하 on 2022/09/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowSene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
    }
}

