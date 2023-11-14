//
//  ChatRoomUserSettingsCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 22.08.2022.
//

import UIKit
import EasyPeasy

class ChatRoomUserSettingsCell: UITableViewCell {
    
//    person.crop.circle.fill.badge.xmark
    
    var settingsImage: UIImageView = {
        let img = UIImageView()
        if #available(iOS 13.0, *) {
            img.image = UIImage(systemName: "nosign")
        } else {
            // Fallback on earlier versions
        }
        return img
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
