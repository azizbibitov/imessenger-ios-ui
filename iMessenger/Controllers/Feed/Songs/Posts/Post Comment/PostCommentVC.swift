//
//  PostCommentVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 22.08.2022.
//

import UIKit
import EasyPeasy

class PostCommentVC: UIViewController {

    var mainView: PostCommentView {
        return view as! PostCommentView
    }
    
    override func loadView() {
        super.loadView()
        
        view = PostCommentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "colorLightGray")
    }
}
