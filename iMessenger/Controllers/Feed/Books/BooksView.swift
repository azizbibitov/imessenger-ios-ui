//
//  BooksView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import EasyPeasy

class BooksView: UIView {
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .plain)
        tbl.backgroundColor = .clear
        tbl.keyboardDismissMode = .onDrag
        tbl.refreshControl = UIRefreshControl()
        tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(BooksTableViewCell.self, forCellReuseIdentifier: "booksTableViewCell")
        return tbl
    }()
    
    var footerText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Click to scroll up ⌃"
        lbl.textColor = .lightGray.withAlphaComponent(0.7)
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        footerText.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(footerTextTap)))

        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
        footerView.backgroundColor = .clear
        tableView.tableFooterView = footerView
        
        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Top(2), Bottom()
        ])
        
        footerView.addSubview(footerText)
        footerText.easy.layout([
            Center()
        ])
        
    }
    
    @objc func footerTextTap() {
        let topRow = IndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: topRow, at: .top, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
