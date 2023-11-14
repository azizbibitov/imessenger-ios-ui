//
//  ChatRoomView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class ChatRoomView: UIView, UITextViewDelegate {
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Mekan Designer"
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = UIColor(named: "colorWhiteBlackText")
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "21 minute ago"
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .lightGray
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    var textInputView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        vw.clipsToBounds = true
        vw.isUserInteractionEnabled = true
        return vw
    }()
    
    var textViewSend: UITextView = {
        let txtView = UITextView()
        txtView.textColor = UIColor(named: "colorWhiteBlackText")
        txtView.font = .systemFont(ofSize: 15)
        txtView.isUserInteractionEnabled = true
        txtView.backgroundColor = .clear
        return txtView
    }()
    
    var sendButton: UIButton = {
        let btn = UIButton()
        if #available(iOS 13.0, *) {
            btn.setImage(UIImage(systemName: "paperplane.circle.fill"), for: .normal)
        } else {
            btn.setImage(UIImage(named: "send-no-size"), for: .normal)
        }
        btn.imageView?.easy.layout([ Size(35) ])
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 30/2
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return btn
    }()
    
//    var shouldSendButton: Bool {
//        guard let textView = textViewSend.text else { return true }
//        return textView.isEmpty ? false : true
//    }
    
    var micButton: UIButton = {
        let btn = UIButton()
        if #available(iOS 13.0, *) {
            btn.setImage(UIImage(systemName: "mic.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        btn.imageView?.easy.layout([ Size(35) ])
        btn.imageView?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    var fileButton: UIButton = {
        let btn = UIButton()
        if #available(iOS 13.0, *) {
            btn.setImage(UIImage(systemName: "folder.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        btn.imageView?.easy.layout([ Size(35) ])
        btn.imageView?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    var emojiButton = CustomEmojiButton()
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ChatRoomCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.keyboardDismissMode = .onDrag
        tableView.backgroundColor = UIColor(named: "colorChatRoomBackground")
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textViewSend.delegate = self
//        sendButton.isEnabled = shouldSendButton
        
        emojiButton.textField = textViewSend
        if #available(iOS 13.0, *) {
            emojiButton.setImage(UIImage(systemName: "face.smiling")?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        emojiButton.addTarget(self, action: #selector(emojiButtonTapped), for: .touchUpInside)
        emojiButton.imageView?.easy.layout([ Size(32) ])
        emojiButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        sendButton.isHidden = true
        fileButton.isHidden = false
        micButton.isHidden = false
        
        self.addSubview(textInputView)
        textInputView.easy.layout([
            Leading(), Trailing(), Bottom()
        ])
        
        textInputView.addSubview(micButton)
        micButton.easy.layout([
            Trailing(15), Size(35), CenterY()
        ])
        
        textInputView.addSubview(fileButton)
        fileButton.easy.layout([
            Trailing(10).to(micButton, .leading), Size(35), CenterY()
        ])
        
        textInputView.addSubview(emojiButton)
        emojiButton.easy.layout([
            Leading(15), Size(35), CenterY()
        ])
        
        textInputView.addSubview(sendButton)
        sendButton.easy.layout([
            Trailing(15), Size(35), CenterY()
        ])
        
        textInputView.addSubview(textViewSend)
        textViewSend.easy.layout([
            Leading(10).to(emojiButton, .trailing), Trailing(60), Height(45), Top(2), Bottom(2)
        ])
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(),
            Trailing(),
            Bottom().to(textInputView, .top),
            Top().to(self.safeAreaLayoutGuide, .top)
        ])
    }
    
    @objc func sendButtonTapped() {
        textViewSend.clearsOnInsertion = true
    }
    
    @objc func emojiButtonTapped() {
        emojiButton.becomeFirstResponder()
    }
    
    func textViewDidChange(_ textView: UITextView) {
//        sendButton.isEnabled = shouldSendButton
            if self.textViewSend.text.isEmpty == false {
                self.micButton.isHidden = true
                self.fileButton.isHidden = true
                self.sendButton.isHidden = false
        } else {
            self.micButton.isHidden = false
            self.fileButton.isHidden = false
            self.sendButton.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
