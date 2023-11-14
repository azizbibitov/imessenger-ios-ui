//
//  AppDelegate.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 28.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = TabBarController() //UINavigationController(rootViewController: TabBarController())
            window?.makeKeyAndVisible()
        
            if #available(iOS 13.0, *) {
                window?.overrideUserInterfaceStyle = ThemeUserDefaults.shared.theme.getUserInterfaceStyle()
            } else {
                // Fallback on earlier versions
            }
        
        if !AccountUserDefaults.shared.isFirstOpen(){
            window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        } else {
            AccountUserDefaults.shared.firstOpen()
            window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        }

        if AccountUserDefaults.shared.getPinCodeApp().count == 4 {
            let pinCodeVC = EnterPinCodeVC()
            pinCodeVC.headerTitle = "Enter Pin Code"
            pinCodeVC.enterPinCode = true
            window?.rootViewController = pinCodeVC
        } else {
            window?.rootViewController = TabBarController()
        }
            return true
    }
}

