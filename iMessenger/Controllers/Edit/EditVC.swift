//
//  EditVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class EditVC: UIViewController {

    var inputTextViewBottomConstraint: NSLayoutConstraint!
    
    var bottomHeight: CGFloat {
        guard #available(iOS 11.0, *),
            let window = UIApplication.shared.keyWindow else {
                return 0
        }
        return window.safeAreaInsets.bottom
    }
    
    var mainView: EditView {
        return view as! EditView
    }
    
    override func loadView() {
        super.loadView()
        
        view = EditView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.addUserImageCallback = { [weak self] in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self?.present(imagePicker, animated: true, completion: nil)
        }
        
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Edit Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = true
        
            navigationItem.hidesBackButton = true
        let leftBarButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cencelLeftButtonTap))
        leftBarButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        let rightBarButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveLeftButtonTap))
        rightBarButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func cencelLeftButtonTap() {
        self.navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func saveLeftButtonTap() {
        self.navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        let userInfo = notification.userInfo!
        if var keyboardFrame  = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            self.inputTextViewBottomConstraint.constant = -keyboardFrame.height + bottomHeight
            UIView.animate(withDuration: keyboardAnimationDuration) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        let userInfo = notification.userInfo!
        if var keyboardFrame  = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval, let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            self.inputTextViewBottomConstraint.constant = 0
            UIView.animate(withDuration: keyboardAnimationDuration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
