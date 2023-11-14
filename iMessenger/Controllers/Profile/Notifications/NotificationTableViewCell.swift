//
//  NotificationTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 29.08.2022.
//

import UIKit
import EasyPeasy

class NotificationTableViewCell: UITableViewCell {

    var notificationName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 16)
        return lbl
    }()
    
    var onOffSwtitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = ColorUserDefaults.shared.color.getColorInterface()
        return sw
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
