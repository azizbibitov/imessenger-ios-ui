//
//  ChatListTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class ChatListTableViewCell: UITableViewCell {
    
    var userImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 30
        return img
    }()
    
    var userName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    var userOnlineStatus: UIView = {
        let vw = UIView()
//        vw.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        vw.layer.cornerRadius = 18/2
        vw.clipsToBounds = true
        vw.layer.borderWidth = 2.5
        vw.layer.borderColor = UIColor(named: "colorWhiteBlackCell")?.cgColor
        return vw
    }()
    
    var userMessage: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    var userMessageMute: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorDarkGray")
        return img
    }()
    
    var userMessageDate: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    var userMessageStatus: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
//        img.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        return img
    }()
    
    var userMessageCountView: UILabel = {
        let lbl = UILabel()
//        lbl.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        lbl.layer.cornerRadius = 25/2
        lbl.clipsToBounds = true
        lbl.text = "2"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    var userMessageCountViewMute: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .lightGray
        lbl.layer.cornerRadius = 25/2
        lbl.clipsToBounds = true
        lbl.text = "2"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 12)
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(userImage)
        userImage.easy.layout([
            Size(60), Leading(10), CenterY()
        ])
        
        self.contentView.addSubview(userOnlineStatus)
        userOnlineStatus.easy.layout([
            Size(18), Bottom(2).to(userImage, .bottom), Trailing(2).to(userImage, .trailing)
        ])
        
        self.contentView.addSubview(userName)
        userName.easy.layout([
            Leading(10).to(userImage, .trailing), Top(3).to(userImage, .top)
        ])
        
        self.contentView.addSubview(userMessage)
        userMessage.easy.layout([
            Leading(10).to(userImage, .trailing), Trailing(60), Top().to(userName, .bottom)
        ])
        
        self.contentView.addSubview(userMessageMute)
        userMessageMute.easy.layout([
            CenterY().to(userName, .centerY), Leading(1).to(userName, .trailing), Size(20)
        ])
        
        self.contentView.addSubview(userMessageDate)
        userMessageDate.easy.layout([
            Top().to(userImage, .top), Trailing(10),
        ])
        
        self.contentView.addSubview(userMessageStatus)
        userMessageStatus.easy.layout([
            Trailing(3).to(userMessageDate, .leading), Size(12), CenterY().to(userMessageDate, .centerY)
        ])
        
        self.contentView.addSubview(userMessageCountView)
        userMessageCountView.easy.layout([
            Size(25), Trailing(10), Top(2).to(userMessageDate, .bottom)
        ])
        
        self.contentView.addSubview(userMessageCountViewMute)
        userMessageCountViewMute.easy.layout([
            Size(25), Trailing(10), Top(2).to(userMessageDate, .bottom)
        ])
  
    }
    
    func configureChatList(data: ChatListModel) {
        userImage.image = UIImage(named: data.userImage)
        userOnlineStatus.isHidden = data.userOnlineStatus
        userName.text = data.userName
        userMessage.text = data.userMessage
        userMessageMute.image = UIImage(named: data.userMessageMute)?.withRenderingMode(.alwaysTemplate)
        userMessageDate.text = data.userMessageDate
        userMessageStatus.image = UIImage(named: data.userMessageStatus)?.withRenderingMode(.alwaysTemplate)
        userMessageCountView.isHidden = data.userMessageCountView
        userMessageCountViewMute.isHidden = data.userMessageCountViewMute
    }

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    
    }
}

