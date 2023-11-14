//
//  AppearanceCollectionViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 01.09.2022.
//

import UIKit
import EasyPeasy

class AppearanceCollectionViewCell: UICollectionViewCell {
    
    var userColorImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "storyImageBG")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .systemBlue
        img.isHidden = true
        return img
    }()
    
    var userColorView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 50/2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(userColorImage)
        userColorImage.easy.layout([
            Size(60)
        ])
        
        self.contentView.addSubview(userColorView)
        userColorView.easy.layout([
            Size(50), CenterY().to(userColorImage, .centerY), CenterX().to(userColorImage, .centerX)
        ])
    }
    
    func configureUserInterfaceColor(data: UserInterfaceColorModel) {
        userColorView.backgroundColor = UIColor(named: data.userInterfaceColor)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
