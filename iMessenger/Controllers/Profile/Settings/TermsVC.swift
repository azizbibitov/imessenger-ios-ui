//
//  TermsVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 27.08.2022.
//

import UIKit

class TermsVC: UIViewController, ControllerTitle {

    static var title: String { return "Terms of use" }
    static var image: String { return "terms" }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Terms of use"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }

}
