//
//  ContextMenu.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 19.08.2022.
//

import UIKit

protocol ContextMenu {
}

@available(iOS 13.0, *)
extension ContextMenu {
    func makeDefaultMenu() -> UIMenu {

        let share = UIAction(title: "Mute", image: UIImage(systemName: "speaker.slash.fill")) { action in
            
        }

        let rename = UIAction(title: "Read", image: UIImage(systemName: "checkmark.bubble.fill")) { action in
           
        }

        
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash.fill"), attributes: .destructive) { action in
          
        }

        
        return UIMenu(title: "", children: [share, rename, delete])
    }
}
