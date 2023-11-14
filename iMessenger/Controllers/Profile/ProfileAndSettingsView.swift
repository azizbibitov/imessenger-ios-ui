//
//  ProfileAndSettingsView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit
import EasyPeasy

class ProfileAndSettingsView: UIView {

    var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            let tbl = UITableView(frame: .zero, style: .insetGrouped)
            tbl.backgroundColor = .clear
            tbl.keyboardDismissMode = .onDrag
            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(PASTableViewCell.self, forCellReuseIdentifier: "pasTableViewCell")
            return tbl
        } else {
            let tbl = UITableView(frame: .zero, style: .grouped)
            tbl.backgroundColor = .clear
            tbl.keyboardDismissMode = .onDrag
            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(PASTableViewCell.self, forCellReuseIdentifier: "pasTableViewCell")
            return tbl
        }
    }()
    
    var userImageStory: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "myStoryImage")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .systemOrange
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var userImage: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "img5"), for: .normal)
        btn.imageView?.easy.layout([ Size(90) ])
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 90/2
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(userImageStoryTap), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    var dataSourceView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .clear
        return vw
    }()
    
    var userName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Mekan Designer"
        lbl.numberOfLines = 0
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    var userNickName: UILabel = {
        let lbl = UILabel()
        lbl.text = "@designtm11"
        lbl.numberOfLines = 1
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    var myFriendsView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .clear
        return vw
    }()
    
    var myFriendsCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "133"
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    var myFriendsText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Friends"
        lbl.textColor = .lightGray
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    var myFollowView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .clear
        return vw
    }()
    
    var myFollowCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "42"
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    var myFollowText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Follow"
        lbl.textColor = .lightGray
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    var userStatus: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel rhoncus ex, quis sagittis ligula. Sed ut orci vitae ex hendrerit varius hendrerit a purus. Etiam maximus nibh iaculis tortor consequat dictum."
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var userBirthDay: UILabel = {
        let lbl = UILabel()
        lbl.text = "Birthday: "
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var userBirthDayText: UILabel = {
        let lbl = UILabel()
        lbl.text = "21.04.2021"
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var userSex: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sex: "
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var userSexText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Male"
        lbl.textColor = UIColor(named: "colorDarkGray")
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var userImageStoryCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        userImageStory.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userImageStoryTap)))
        userImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userImageStoryTap)))
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-40, height: 250))
        headerView.backgroundColor = .clear
        tableView.tableHeaderView = headerView
        
        headerView.addSubview(userImageStory)
        userImageStory.easy.layout([
            Size(100), Top(10), Leading(20)
        ])
        
        userImageStory.addSubview(userImage)
        userImage.easy.layout([
            Size(90), Center()
        ])
        
        headerView.addSubview(dataSourceView)
        dataSourceView.easy.layout([
            Top(10), Trailing(20), Leading(20).to(userImageStory, .trailing), Bottom().to(userImageStory, .bottom)
        ])
        
        dataSourceView.addSubview(userName)
        userName.easy.layout([
            CenterX(), Top(5)
        ])
        
        dataSourceView.addSubview(userNickName)
        userNickName.easy.layout([
            CenterX(), Top().to(userName, .bottom)
        ])
        
        dataSourceView.addSubview(myFriendsView)
        myFriendsView.easy.layout([
            Top(20).to(userName, .bottom), Trailing(60)
        ])
        
        myFriendsView.addSubview(myFriendsCount)
        myFriendsCount.easy.layout([
            Top(), CenterX()
        ])
        
        myFriendsView.addSubview(myFriendsText)
        myFriendsText.easy.layout([
            Top().to(myFriendsCount, .bottom), CenterX()
        ])
        
        dataSourceView.addSubview(myFollowView)
        myFollowView.easy.layout([
            Top(20).to(userName, .bottom), Leading(60)
        ])
        
        myFollowView.addSubview(myFollowCount)
        myFollowCount.easy.layout([
            Top(), CenterX()
        ])
        
        myFollowView.addSubview(myFollowText)
        myFollowText.easy.layout([
            Top().to(myFollowCount, .bottom), CenterX()
        ])
        
        headerView.addSubview(userStatus)
        userStatus.easy.layout([
            Leading(20), Trailing(20), Top(20).to(userImageStory, .bottom),
        ])
        
        headerView.addSubview(userBirthDay)
        userBirthDay.easy.layout([
            Leading(20), Top(10).to(userStatus, .bottom)
        ])
        
        headerView.addSubview(userBirthDayText)
        userBirthDayText.easy.layout([
            Leading(5).to(userBirthDay, .trailing), CenterY().to(userBirthDay, .centerY)
        ])
        
        headerView.addSubview(userSex)
        userSex.easy.layout([
            Leading(20), Top(5).to(userBirthDay, .bottom)
        ])
        
        headerView.addSubview(userSexText)
        userSexText.easy.layout([
            Leading(5).to(userSex, .trailing), CenterY().to(userSex, .centerY)
        ])
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()
        ])
        
    }
    
    @objc func userImageStoryTap() {
        userImageStoryCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
