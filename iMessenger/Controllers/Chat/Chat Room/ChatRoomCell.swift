//
//  ChatRoomCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 31.08.2022.
//

import UIKit
import EasyPeasy

class ChatRoomCell: UITableViewCell {
    
    static let shared = ChatRoomCell()
    
    var chatBubbleView: UIView = {
        let vw = UIView()
        vw.layer.cornerRadius = 12
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.isUserInteractionEnabled = true
        vw.clipsToBounds = true
        return vw
    }()
    
    var chatText: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
//        lbl.font = .systemFont(ofSize: 16)
        return lbl
    }()
    
//    let text: String = "09:37"
    
    var chatTime: UILabel = {
        let lbl = UILabel()
        lbl.text = "09:37"
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            chatBubbleView.backgroundColor = chatMessage.isIncoming ? UIColor(named: "colorChatRoom") : ColorUserDefaults.shared.color.getColorInterface()
            chatText.textColor = chatMessage.isIncoming ? UIColor(named: "colorWhiteBlackText") : .white
            chatText.text = chatMessage.text
            chatTime.textColor = chatMessage.isIncoming ? UIColor(named: "colorWhiteBlackText") : .white
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        let attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
//
//        chatText.attributedText = attributedText
        
        self.backgroundColor = .clear
        
        self.contentView.addSubview(chatBubbleView)
        chatBubbleView.easy.layout([
            Top(2), Bottom(2)
        ])
        
        chatBubbleView.addSubview(chatText)
        chatText.easy.layout([
            Leading(10), Trailing(10), Top(7), Bottom(7), Width(<=250),
        ])
        
        leadingConstraint = chatText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        leadingConstraint.isActive = false
        
        trailingConstraint = chatText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        trailingConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
