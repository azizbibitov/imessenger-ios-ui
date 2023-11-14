//
//  AboutUSVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 27.08.2022.
//

import UIKit

class AboutUSVC: UIViewController, ControllerTitle {
    
    static var title: String { return "About Us" }
    static var image: String { return "info" }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "About us"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }

}
