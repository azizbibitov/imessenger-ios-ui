//
//  FeedVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 12.08.2022.
//

import UIKit
import EasyPeasy

class FeedVC: UIViewController, UIDocumentInteractionControllerDelegate, UISearchBarDelegate {

    let searchController = UISearchController(searchResultsController: nil)
    
    var topView = UIView()
    
    lazy var pagingVC = PagingVC()
    
    var mainView: FeedView {
        return view as! FeedView
    }
    
    override func loadView() {
        super.loadView()
        
        view = FeedView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.sizeToFit()
        searchBar.resignFirstResponder()
    
        view.backgroundColor = UIColor(named: "colorTabBarBackground")
        
        topView.backgroundColor = UIColor(named: "colorTabBarBackground")
        view.addSubview(topView)
        topView.easy.layout([
            Leading(), Trailing(), Top(), Height(70)
        ])
        
        searchBar.backgroundColor = UIColor(named: "colorTabBarBackground")
        view.addSubview(searchBar)
            searchBar.easy.layout([
                CenterX(), Top(40), Width(UIScreen.main.bounds.width-10)
        ])
        
        addPagingVC()        
        pagingVC.view.easy.layout([
            Top().to(searchBar, .bottom), Bottom().to(view.safeAreaLayoutGuide, .bottom), Leading(), Trailing()
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }

    
    func addPagingVC(){
        self.view.addSubview(pagingVC.view)
        self.addChild(pagingVC)
        pagingVC.didMove(toParent: self)
        }
    }

