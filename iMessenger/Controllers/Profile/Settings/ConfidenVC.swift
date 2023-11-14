//
//  ConfidenVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 27.08.2022.
//

import UIKit
import EasyPeasy

class ConfidenVC: UIViewController, ControllerTitle {
    
    static var title: String { return "Confidentiality" }
    static var image: String { return "conf" }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Confidentiality"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
}
