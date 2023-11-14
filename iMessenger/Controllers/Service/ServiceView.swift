//
//  ServiceView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 29.08.2022.
//

import UIKit
import EasyPeasy

class ServiceView: UIView {

    var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            let tbl = UITableView(frame: .zero, style: .insetGrouped)
            tbl.backgroundColor = .clear
//            tbl.separatorStyle = .none
            tbl.keyboardDismissMode = .onDrag
            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(ServiceTableViewCell.self, forCellReuseIdentifier: "serviceTableViewCell")
            return tbl
        } else {
            let tbl = UITableView(frame: .zero, style: .grouped)
            tbl.backgroundColor = .clear
//            tbl.separatorStyle = .none
            tbl.keyboardDismissMode = .onDrag
            tbl.refreshControl = UIRefreshControl()
            tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tbl.register(ServiceTableViewCell.self, forCellReuseIdentifier: "serviceTableViewCell")
            return tbl
        }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
