//
//  AppDelegate.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpInitView()
        return true
    }
    
    private func setUpInitView() {
        let coordinator = MainCoordinator()
        coordinator.start()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = coordinator.navigationController
        self.window?.makeKeyAndVisible()
        
    }

}

