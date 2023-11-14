//
//  EditView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class EditView: UIView {

    var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.keyboardDismissMode = .interactive
        return scroll
    }()
    
    var userImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "user4")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 50
        img.clipsToBounds = true
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var userImageAddIcon: UIImageView = {
        let img = UIImageView()
        if #available(iOS 13.0, *) {
            img.image = UIImage(systemName: "photo.circle.fill")?.withRenderingMode(.alwaysTemplate)
        } else {
            // Fallback on earlier versions
        }
        img.backgroundColor = .white
        img.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var userNickNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "@nickname"
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var userStatusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your status"
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var userDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your birthday"
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var pickerToolbar: UIToolbar?
    
    var userDatePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.setDate("2000-01-01T00:00:00.00001Z".getDate() ?? Date(), animated: false)
        datePicker.maximumDate = Date()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        return datePicker
    }()
    
    var doneCallback: ( (_ date: String) -> Void )?
    var addUserImageCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUIToolBar()
        userImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userImageTapped)))
        
        self.addSubview(scrollView)
        scrollView.easy.layout([
            Leading(), Trailing(), Top(), Bottom()
        ])
        
        scrollView.addSubview(userImage)
        userImage.easy.layout([
            CenterX(), Size(100), Top(20)
        ])
        
        scrollView.addSubview(userImageAddIcon)
        userImageAddIcon.easy.layout([
            Trailing().to(userImage, .trailing), Bottom().to(userImage, .bottom), Size(30)
        ])
        
        scrollView.addSubview(userNameTextField)
        userNameTextField.easy.layout([
            Height(45), Width(UIScreen.main.bounds.width-40), Top(20).to(userImage, .bottom), CenterX()
        ])
        
        scrollView.addSubview(userNickNameTextField)
        userNickNameTextField.easy.layout([
            Height(45), Width(UIScreen.main.bounds.width-40), Top(10).to(userNameTextField, .bottom), CenterX()
        ])
        
        scrollView.addSubview(userStatusTextField)
        userStatusTextField.easy.layout([
            Height(45), Width(UIScreen.main.bounds.width-40), Top(10).to(userNickNameTextField, .bottom), CenterX()
        ])
        
        scrollView.addSubview(userDateTextField)
        userDateTextField.easy.layout([
            Height(45), Width(UIScreen.main.bounds.width-40), Top(10).to(userStatusTextField, .bottom), CenterX()
        ])
        
        userDateTextField.inputView = userDatePicker
        userDateTextField.inputAccessoryView = pickerToolbar
        
    }
    
    func createUIToolBar() {
        pickerToolbar = UIToolbar()
        pickerToolbar?.autoresizingMask = .flexibleHeight
        pickerToolbar?.backgroundColor = UIColor.white
        pickerToolbar?.isTranslucent = false
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnClicked(_:)))
        cancelButton.tintColor = UIColor.red
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        doneButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()

        pickerToolbar?.items = [cancelButton, flexSpace, doneButton]
    }
    
    @objc func cancelBtnClicked(_ button: UIBarButtonItem?) {
        userDateTextField.resignFirstResponder()
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        userDateTextField.resignFirstResponder()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd.MM.yyyy"
        userDateTextField.text = formatter.string(from: userDatePicker.date)
        
        
        doneCallback?(formatter.string(from: userDatePicker.date))
        
    }
    
    @objc func userImageTapped() {
        addUserImageCallback?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension String {
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_us_posix")
        let date = dateFormatter.date(from: self)
        return date
    }
}
