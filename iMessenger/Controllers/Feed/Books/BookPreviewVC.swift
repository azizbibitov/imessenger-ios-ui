//
//  BookPreviewVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 21.08.2022.
//

import UIKit

class BookPreviewVC: UIViewController {

    var mainView: BookPreviewView {
        return view as! BookPreviewView
    }
    
    override func loadView() {
        super.loadView()
        
        view = BookPreviewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorBackground")
        // Do any additional setup after loading the view.
    }

}
