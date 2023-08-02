//
//  SceneDelegate.swift
//  CollectionView-kelvin fok
//
//  Created by Kim Yewon on 2023/07/31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = CollectionViewController()
        
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }

}
