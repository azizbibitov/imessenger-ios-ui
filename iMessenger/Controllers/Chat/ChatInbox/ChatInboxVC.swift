//
//  ChatInboxVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 02.09.2022.
//

import UIKit
import EasyPeasy

class ChatInboxVC: UIViewController {

    var mainView: ChatInboxView {
        return view as! ChatInboxView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ChatInboxView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Chat Requests"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
}
