//
//  StoryVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 25.08.2022.
//

import UIKit
import EasyPeasy

class StoryVC: UIViewController {

    var mainView: StoryView {
        return view as! StoryView
    }
    
    override func loadView() {
        super.loadView()
        
        view = StoryView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        mainView.closeStoryButtonCallback = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        mainView.storyDidFinishedCallback = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        mainView.userMoreButtonCallback = { [weak self] in
            self?.mainView.spb.isPaused = true

            let optionMenu = UIAlertController(title: nil, message: "@username", preferredStyle: .actionSheet)

               let defaultAction = UIAlertAction(title: "Complain", style: .destructive, handler: {
                   (alert: UIAlertAction!) -> Void in
                   print("complain tapped")
               })

               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
                   (alert: UIAlertAction!) -> Void in
                   self?.mainView.spb.isPaused = false
               })
               optionMenu.addAction(defaultAction)
               optionMenu.addAction(cancelAction)
            self?.present(optionMenu, animated: true, completion: nil)
        }
       
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
          return true
      }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
}

