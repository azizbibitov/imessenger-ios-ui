//
//  ChatRoomUserVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 22.08.2022.
//

import UIKit

class ChatRoomUserVC: UIViewController {

    var mainView: ChatRoomUserSettingsView {
        return view as! ChatRoomUserSettingsView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ChatRoomUserSettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Mekan Designer"
    }

}
