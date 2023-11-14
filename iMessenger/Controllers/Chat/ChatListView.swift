//
//  ChatListView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit
import EasyPeasy

class ChatListView: UIView {
    
    var tableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .grouped)
        tbl.backgroundColor = .clear
        tbl.refreshControl = UIRefreshControl()
        tbl.keyboardDismissMode = .onDrag
        tbl.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(ChatListTableViewCell.self, forCellReuseIdentifier: "chatListTableViewCell")
        return tbl
    }()
    
    var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumInteritemSpacing = 10
        collectionLayout.minimumLineSpacing = 10
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: 70, height: 70)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        collection.backgroundColor = UIColor(named: "colorBackground")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "storyCollectionViewCell")
        return collection
    }()
    
    var footerText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Click to scroll up ⌃"
        lbl.textColor = UIColor.lightGray.withAlphaComponent(0.7)
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerText.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(footerTextTap)))
        
        let headerView = collectionView
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 110)
        headerView.backgroundColor = .clear
        tableView.tableHeaderView = headerView
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))
        footerView.backgroundColor = .clear
        tableView.tableFooterView = footerView

        self.addSubview(tableView)
        tableView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()//.to(safeAreaLayoutGuide, .top)
        ])

        footerView.addSubview(footerText)
        footerText.easy.layout([
            CenterX(), Top()
        ])
    }
    
    @objc func footerTextTap() {
        let topRow = IndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: topRow, at: .bottom, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
