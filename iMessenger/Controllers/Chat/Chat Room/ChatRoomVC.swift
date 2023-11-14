//
//  ChatRoomVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class ChatRoomVC: UIViewController {
    
    var chatMessageText: [ChatMessage] = [
        ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue pretium ante, vehicula tempus justo mattis ac. Sed sollicitudin turpis non tellus pulvinar malesuada. Aliquam erat volutpat. Sed ultricies sagittis mattis. Quisque facilisis nisi sed lectus feugiat pretium. Donec eu ullamcorper nunc. Morbi vel justo nec risus ultrices tristique sed a neque. Duis consequat risus ante, non maximus justo pretium ac. Nam vestibulum metus in turpis finibus iaculis. Donec odio lectus, facilisis vitae ex quis, malesuada pharetra metus. Vestibulum ornare dui id ante cursus, at feugiat dolor euismod. Vivamus non bibendum sem.", isIncoming: false),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: false),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex. Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: true),
        ChatMessage(text: "Salam gowmy yagdaylar", isIncoming: false),
        ChatMessage(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue pretium ante, vehicula tempus justo mattis ac. Sed sollicitudin turpis non tellus pulvinar malesuada. Aliquam erat volutpat. Sed ultricies sagittis mattis. Quisque facilisis nisi sed lectus feugiat pretium. Donec eu ullamcorper nunc. Morbi vel justo nec risus ultrices tristique sed a neque. Duis consequat risus ante, non maximus justo pretium ac. Nam vestibulum metus in turpis finibus iaculis. Donec odio lectus, facilisis vitae ex quis, malesuada pharetra metus. Vestibulum ornare dui id ante cursus, at feugiat dolor euismod. Vivamus non bibendum sem.", isIncoming: false),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: false),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex. Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: true),
        ChatMessage(text: "Salam gowmy yagdaylar", isIncoming: true),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: false),
        ChatMessage(text: "Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex. Nulla facilisi. Vestibulum imperdiet condimentum neque, a pellentesque ex.", isIncoming: false),
        ChatMessage(text: "Salam gowmy yagdaylar", isIncoming: false),
    ]
    
    var inputTextViewBottomConstraint: NSLayoutConstraint!
    var bottomHeight: CGFloat {
        guard #available(iOS 11.0, *),
            let window = UIApplication.shared.keyWindow else {
                return 0
        }
        return window.safeAreaInsets.bottom
    }
    
    var chatMessages = [ChatMessage]()
    
    var mainView: ChatRoomView {
        return view as! ChatRoomView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ChatRoomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatMessageText.reverse()
        chatMessages = self.chatMessageText
        
//        let height = CGFloat(10)
//        self.additionalSafeAreaInsets.top = height
        
        let menuBtn = UIButton(type: .custom)
        menuBtn.setImage(UIImage(named: "user2"), for: .normal)
        menuBtn.clipsToBounds = true
        menuBtn.layer.cornerRadius = 45/2
        menuBtn.addTarget(self, action: #selector(chatRoomMoreButton), for: .touchUpInside)

        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 45)
        currWidth?.isActive = true
        let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 45)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = menuBarItem
        
        
        view.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        navigationItem.titleView = mainView.titleStackView
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        inputTextViewBottomConstraint = mainView.textInputView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        inputTextViewBottomConstraint.isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    @objc func chatRoomMoreButton() {
        let vc = ChatRoomUserVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        let userInfo = notification.userInfo!
        if var keyboardFrame  = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            self.inputTextViewBottomConstraint.constant = -keyboardFrame.height + bottomHeight
            UIView.animate(withDuration: keyboardAnimationDuration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let userInfo = notification.userInfo!
        if var keyboardFrame  = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval, let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            self.inputTextViewBottomConstraint.constant = 0
            UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}


extension ChatRoomVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessageText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ChatRoomCell
        let chatMessage = chatMessageText[indexPath.row]
        cell.chatMessage = chatMessage
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        
        cell.backgroundColor = .clear
        
        return cell
    }
}
