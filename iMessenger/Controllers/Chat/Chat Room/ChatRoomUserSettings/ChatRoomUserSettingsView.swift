//
//  ChatRoomUserSettingsView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 22.08.2022.
//

import UIKit
import EasyPeasy

class ChatRoomUserSettingsView: UIView {

    var tableView: UITableView = {
            let tbl = UITableView(frame: .zero, style: .grouped)
            tbl.backgroundColor = UIColor(named: "colorLightGray")
            tbl.keyboardDismissMode = .onDrag
            tbl.register(ChatRoomUserSettingsCell.self, forCellReuseIdentifier: "chatRoomUserSettingsCell")
            return tbl
    }()
    
//    var userImageCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
