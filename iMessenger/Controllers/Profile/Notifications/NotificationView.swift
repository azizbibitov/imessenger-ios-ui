//
//  NotificationView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class NotificationView: UIView {

    var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            let tbl = UITableView(frame: .zero, style: .insetGrouped)
            tbl.backgroundColor = .clear
            tbl.keyboardDismissMode = .onDrag
//            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(NotificationTableViewCell.self, forCellReuseIdentifier: "notificationTableViewCell")
            return tbl
        } else {
            let tbl = UITableView(frame: .zero, style: .grouped)
            tbl.backgroundColor = .clear
            tbl.keyboardDismissMode = .onDrag
//            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(NotificationTableViewCell.self, forCellReuseIdentifier: "notificationTableViewCell")
            return tbl
        }
    }()
    
    var tableHeaderView = UIView()
    
    var allNotificationView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableHeaderView.backgroundColor = .clear
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Top(), Bottom()
        ])
        
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: 0, height: 75)
        tableView.tableHeaderView = tableHeaderView
        
        tableHeaderView.addSubview(allNotificationView)
        allNotificationView.easy.layout([
            Leading(20), Trailing(20), Center(), Height(45)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
