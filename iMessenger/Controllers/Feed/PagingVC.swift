//
//  PagingVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 14.08.2022.
//

import UIKit
import Parchment

class PagingVC: PagingViewController {
    
    lazy var selectedPage: Int = 0
    
    lazy var vc = [AllFeedVC.self, PostVC.self, SongVC.self,  MoviesVC.self, BooksVC.self]
    lazy var titles = ["All", "Posts", "Songs", "Movies", "Books"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        menuItemSize = .selfSizing(estimatedWidth: 50, height: 40)
        menuItemLabelSpacing = 20
        borderColor = .clear
        backgroundColor = .clear
        indicatorOptions = .visible(height: 2,
                                    zIndex: 0,
                                    spacing: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15),
                                    insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

        textColor = .lightGray
        font = .systemFont(ofSize: 14)
        selectedFont = .systemFont(ofSize: 14)
        selectedTextColor = UIColor(named: "colorWhiteBlackText")!
        menuBackgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        indicatorColor = ColorUserDefaults.shared.color.getColorInterface()
        
    }
}

extension PagingVC: PagingViewControllerDataSource {
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: titles[index])
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let vc = vc[index]
        return vc.init()
    }

    func numberOfViewControllers(in _: PagingViewController) -> Int {
        return titles.count
    }
}
