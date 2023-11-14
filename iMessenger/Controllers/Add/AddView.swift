//
//  AddView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 02.09.2022.
//

import UIKit

class AddView: UIView {

    var userMoreButtonCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        storyClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(storyCloseTap)))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
