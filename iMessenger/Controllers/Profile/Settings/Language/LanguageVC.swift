//
//  LanguageVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 27.08.2022.
//

import UIKit

class LanguageVC: UIViewController, ControllerTitle, UISearchBarDelegate, UISearchResultsUpdating {

    static var title: String { return "Language" }
    static var image: String { return "language" }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var languagedata: [String] = [
        "Turkmence",
        "Russian",
        "English",
        "Turkce",
        "Arabic",
        "Ivrit",
        "Kurdish",
    ]
    
    var mainView: LanguageView {
        return view as! LanguageView
    }
    
    override func loadView() {
        super.loadView()
        
        view = LanguageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "Language"
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.backgroundColor = .clear
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationItem.searchController = searchController
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
    }
}

extension LanguageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagedata.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageTableViewCell", for: indexPath) as! LanguageTableViewCell
        cell.textLabel?.text = languagedata[indexPath.row]
        cell.accessoryType = .checkmark
        cell.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
