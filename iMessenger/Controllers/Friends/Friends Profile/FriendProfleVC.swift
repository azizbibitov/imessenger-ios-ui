//
//  FriendProfleVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class FriendProfleVC: UIViewController {

    var mainView: FriendProfileView {
        return view as! FriendProfileView
    }
    
    override func loadView() {
        super.loadView()
        
        view = FriendProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
    }

}
