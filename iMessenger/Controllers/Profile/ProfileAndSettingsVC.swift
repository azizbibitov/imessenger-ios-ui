//
//  ProfileAndSettingsVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit
import EasyPeasy

class ProfileAndSettingsVC: UIViewController {

    typealias CustomViewController = ControllerTitle & UIViewController
    private let profileItem: [(title: String, viewControllers: [CustomViewController.Type])] = [
        ("My Source", [
            SongVC.self,
            QRVC.self,
            NotificationVC.self,
            AppearanceVC.self
        ]),
        
        ("My Source", [
            LanguageVC.self,
            BlockListVC.self,
            ConfidenVC.self,
        ]),
        
        ("Settings", [
            TermsVC.self,
            TechnicalVC.self,
            AboutUSVC.self,
            LogOutVC.self
        ]),
    ]
    
    var mainView: ProfileAndSettingsView {
        return view as! ProfileAndSettingsView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ProfileAndSettingsView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Profile"
        
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
        mainView.userImageStoryCallback = { [weak self] in
            print("------------ story tapped ------------")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        mainView.tableView.reloadData()
        
        navigationItem.backBarButtonItem?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "edit"), style: .plain, target: self, action: #selector(bellButtonTapped))
        rightBarButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationItem.rightBarButtonItem = rightBarButton
        
        if AccountUserDefaults.shared.getPinCodeApp().isEmpty {
            let leftButton = UIBarButtonItem(image: UIImage(named: "unlock"), style: .done, target: self, action: #selector(lockButtonTapped))
            leftButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
            navigationItem.leftBarButtonItem = leftButton
        } else {
            let leftButton = UIBarButtonItem(image: UIImage(named: "lock"), style: .done, target: self, action: #selector(lockButtonTapped))
            leftButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
            navigationItem.leftBarButtonItem = leftButton
        }
    }
    
    @objc func handleRefreshControl() {
        mainView.tableView.refreshControl?.endRefreshing()
    }
    
    @objc func bellButtonTapped() {
        let vc = EditVC()
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func lockButtonTapped() {
        let vc = PinCodeVC()
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ProfileAndSettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileItem.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileItem[section].viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return profileItem[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pasTableViewCell", for: indexPath) as! PASTableViewCell
        cell.cellTitle.text = profileItem[indexPath.section].viewControllers[indexPath.row].title
        cell.cellImage.image = UIImage(named: profileItem[indexPath.section].viewControllers[indexPath.row].image)?.withRenderingMode(.alwaysTemplate)
        cell.cellImage.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = profileItem[indexPath.section].viewControllers[indexPath.row].init()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
