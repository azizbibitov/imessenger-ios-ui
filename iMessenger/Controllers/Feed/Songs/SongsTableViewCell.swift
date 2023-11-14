//
//  SongsTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import EasyPeasy

class SongsTableViewCell: UITableViewCell {

    var musicImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 50/2
        return img
    }()
    
    var playIcon: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        return img
    }()
    
    var musicName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    var singerName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    var addIcon: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(musicImage)
        musicImage.easy.layout([
            Leading(10), Size(50), Top(10), Bottom(10)
        ])
        
        musicImage.addSubview(playIcon)
        playIcon.easy.layout([
            CenterY(), CenterX(), Size(24)
        ])
        
        self.contentView.addSubview(musicName)
        musicName.easy.layout([
            Top(3).to(musicImage, .top), Leading(10).to(musicImage, .trailing)
        ])
        
        self.contentView.addSubview(singerName)
        singerName.easy.layout([
            Top().to(musicName, .bottom), Leading(10).to(musicImage, .trailing)
        ])
        
        self.contentView.addSubview(addIcon)
        addIcon.easy.layout([
            CenterY(), Trailing(10), Size(24)
        ])
    }
    
    func configureMusic(data: MusicModel) {
        musicImage.image = UIImage(named: data.musicImage)
        playIcon.image = UIImage(named: data.playIcon)?.withRenderingMode(.alwaysTemplate)
        musicName.text = data.musicName
        singerName.text = data.singerName
        addIcon.image = UIImage(named: data.addIcon)?.withRenderingMode(.alwaysTemplate)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
