//
//  TechnicalVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 27.08.2022.
//

import UIKit

class TechnicalVC: UIViewController, ControllerTitle {
    
    static var title: String { return "Technical support" }
    static var image: String { return "diploma" }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Technical support"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
}
