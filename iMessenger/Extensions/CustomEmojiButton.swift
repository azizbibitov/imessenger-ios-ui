//
//  CustomEmojiButton.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 01.09.2022.
//

import UIKit

class CustomEmojiButton: UIButton, UIKeyInput {

    var hasText: Bool = true
    
    var textField: UITextView?

    func insertText(_ text: String) {
        textField?.insertText(text)
    }

    func deleteBackward() {
        let str = textField?.text.dropLast()
        textField?.text = String(str ?? "")
    }

    override var canBecomeFirstResponder: Bool {
        if textField?.textColor == UIColor.lightGray {
            textField?.text = nil
            textField?.textColor = UIColor.lightGray
        }
        return true
    }

    override var canResignFirstResponder: Bool {
        return true
    }

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}
