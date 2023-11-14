//
//  StoryCollectionViewCell.swift
//  SalamNews
//
//  Created by Nowruz Garryyew on 04.06.2022.
//

import UIKit
import EasyPeasy

class StoryCollectionViewCell: UICollectionViewCell {
    
    var storyImageBG: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "storyImageBG")?.withRenderingMode(.alwaysTemplate)
//        img.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        img.backgroundColor = .clear
        img.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        return img
    }()
    
    var storyImageIcon: UIImageView = {
        let img = UIImageView()
        if #available(iOS 13.0, *) {
            img.image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
            img.tintColor = .white
        } else {
            img.image = UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate)
            img.tintColor = .white
        }
        return img
    }()
    
    var storyImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 60/2
        img.clipsToBounds = true
        img.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
//        img.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        return img
    }()
    
    var userName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(storyImageBG)
        storyImageBG.easy.layout([
            Size(73), Top(-10)
        ])
        
        storyImageBG.addSubview(storyImage)
        storyImage.easy.layout([
            Size(60), Center()
        ])
        
        self.contentView.addSubview(userName)
        userName.easy.layout([
            Leading().to(storyImageBG, .leading), Trailing().to(storyImageBG, .trailing), Top(5).to(storyImageBG, .bottom), CenterX().to(storyImageBG, .centerX)
        ])
        
        storyImage.addSubview(storyImageIcon)
        storyImageIcon.easy.layout([
            Center(), Size(30)
        ])
    
    }
    
    
    func configureStory(data: StoryModel) {
        
        storyImageIcon.isHidden = data.storyImageIcon
        storyImage.image = UIImage(named: data.storyImage)
        userName.text = data.userName
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
