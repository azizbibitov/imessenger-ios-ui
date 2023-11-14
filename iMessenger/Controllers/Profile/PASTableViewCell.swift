//
//  PASTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit
import EasyPeasy

class PASTableViewCell: UITableViewCell {

    var cellTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    var cellImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(cellImage)
        cellImage.easy.layout([
            Leading(10), Top(10), Bottom(10), Size(27)
        ])
        
        self.contentView.addSubview(cellTitle)
        cellTitle.easy.layout([
            Leading(10).to(cellImage, .trailing), CenterY()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
