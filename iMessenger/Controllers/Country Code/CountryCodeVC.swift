//
//  CountryCodeVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class CountryCodeVC: UIViewController {

    var mainView: CountryCodeView {
        return view as! CountryCodeView
    }
    
    override func loadView() {
        super.loadView()
        
        view = CountryCodeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
    }
}
