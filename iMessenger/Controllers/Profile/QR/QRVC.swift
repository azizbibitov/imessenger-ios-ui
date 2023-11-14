//
//  QRVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class QRVC: UIViewController, ControllerTitle {

    static var title: String { return "My QR Code" }
    static var image: String { return "userscan" }
    
    var mainView: QRView {
        return view as! QRView
    }
    
    override func loadView() {
        super.loadView()
        
        view = QRView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.title = "My QR Code"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
}
