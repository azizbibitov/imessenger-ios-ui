//
//  ViewController.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 28.08.2022.
//

    
import UIKit
import EasyPeasy

class ViewController: UIViewController, ControllerTitle {
    
    static var title: String { return "View Controller" }
    static var image: String { return "lock.square.fill" }

        override func viewDidLoad() {
            super.viewDidLoad()
            setRandomBackgroundColor()
        }
    
    func setRandomBackgroundColor() {
        let colors = [
                UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
                UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
                UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
                UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
                UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
            ]
            let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
            view.backgroundColor = colors[randomColor]
        }
    
    }
