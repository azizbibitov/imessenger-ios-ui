//
//  LanguageView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 02.09.2022.
//

import UIKit
import EasyPeasy

class LanguageView: UIView, UISearchBarDelegate {
    
    var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            let tbl = UITableView(frame: .zero, style: .insetGrouped)
            tbl.backgroundColor = UIColor(named: "colorLightGray")
            tbl.register(LanguageTableViewCell.self, forCellReuseIdentifier: "languageTableViewCell")
            return tbl
        } else {
            let tbl = UITableView(frame: .zero, style: .grouped)
            tbl.backgroundColor = UIColor(named: "colorLightGray")
            tbl.register(LanguageTableViewCell.self, forCellReuseIdentifier: "languageTableViewCell")
            return tbl
        }
    }()

    var userMoreButtonCallback: ( ()->Void )?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        storyClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(storyCloseTap)))
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
