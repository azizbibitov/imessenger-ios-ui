//
//  ServiceVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 29.08.2022.
//

import UIKit
import EasyPeasy

class ServiceVC: UIViewController {

    var serviceData = [
        ServiceModel(friendsButton: "friends-circle",
                     friendsText: "Friends",
                     
                     musicButton: "music-circle",
                     musicText: "Music",
                     
                     galleryButton: "gallery-circle",
                     galleryText: "Gallery",
                     
                     moviesButton: "movies-circle",
                     moviesText: "Movies")
    ]
    
    var mainView: ServiceView {
        return view as! ServiceView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ServiceView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Service"
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        mainView.tableView.refreshControl?.endRefreshing()
    }
}

extension ServiceVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceTableViewCell", for: indexPath) as! ServiceTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
