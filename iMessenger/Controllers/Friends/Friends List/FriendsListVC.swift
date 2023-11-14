//
//  FriendsListVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class FriendsListVC: UIViewController {

    var mainView: FriendsListView {
        return view as! FriendsListView
    }
    
    override func loadView() {
        super.loadView()
        
        view = FriendsListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
    }

}
