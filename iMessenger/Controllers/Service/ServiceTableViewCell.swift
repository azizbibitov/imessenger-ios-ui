//
//  ServiceTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 29.08.2022.
//

import UIKit
import EasyPeasy

class ServiceTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        let serviceIconsStack = UIStackView(arrangedSubviews: [friendsView])
//        serviceIconsStack.distribution = .fillEqually
//        serviceIconsStack.axis = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
