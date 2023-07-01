//
//  AppDelegate.swift
//  SearchMovies
//
//  Created by Jadiê on 27/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //salvado e a bençoado minha lista em segundo plano
        print("entrou em background")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("voltou para o primeiro plano")
    }

}

