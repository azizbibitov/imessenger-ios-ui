//
//  AddVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 02.09.2022.
//

import UIKit

class AddVC: UIViewController, ControllerTitle {

    static var title: String { return "Notification" }
    static var image: String { return "bell.square.fill" }
    
    var mainView: AddView {
        return view as! AddView
    }
    
    override func loadView() {
        super.loadView()
        
        view = AddView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        mainView.closeStoryButtonCallback = { [weak self] in
//            self?.dismiss(animated: true)
//        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorBackground")
        
        navigationItem.title = "Add+Friends"
        
    }
}
