//
//  MusicVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit
import EasyPeasy

class MusicVC: UIViewController, ControllerTitle {

    static var title: String { return "My Music" }
    static var image: String { return "music.note.list" }
    
    var mainView: MusicView {
        return view as! MusicView
    }
    
    override func loadView() {
        super.loadView()
        
        view = MusicView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorBackground")
        
        navigationItem.title = "Music"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }

}
