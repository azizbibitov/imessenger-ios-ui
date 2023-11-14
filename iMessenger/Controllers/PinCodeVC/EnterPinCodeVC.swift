//
//  EnterPinCodeVC.swift
//  Salam-beta
//
//  Created by Maksadow Meylis on 22.06.2022.
//

import UIKit
import EasyPeasy
import LocalAuthentication

class EnterPinCodeVC: UIViewController {
    
    var enterPinCode = false
    var repeatPinCode = false
    var firstPinCode: String = ""
    var headerTitle: String = ""
    
    let passcode = PassCode()
    
    var signBtn: UIButton = {
        let btn = UIButton()
        btn.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        btn.imageView?.easy.layout([ Size(35) ])
        return btn
    }()
    
    var lock: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "lock")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        img.clipsToBounds = false
        return img
    }()
    
    var passcodeText: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.text = "Lorem ipsum dolar sit"
        lbl.textColor = ColorUserDefaults.shared.color.getColorInterface()
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        let buttonImageColor = UIImage(named: "fingerprint")?.withRenderingMode(.alwaysTemplate)
        signBtn.setImage(buttonImageColor, for: .normal)
        
        navigationItem.backBarButtonItem?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        setupUI()
        setupPasscodeTextField()
        signBtn.addTarget(self, action: #selector(fingerprintBtnClick), for: .touchUpInside)
        
        if enterPinCode { fingerprintBtnClick() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(lock)
        lock.easy.layout([
            Top(100).to(view.safeAreaLayoutGuide, .top), CenterX()
        ])
        
        view.addSubview(passcodeText)
        passcodeText.easy.layout([
            Top(20).to(lock, .bottom), CenterX()
        ])
                
        view.addSubview(passcode)
        passcode.easy.layout([
            Top(30).to(passcodeText, .bottom), CenterX(), Height(44), Width(150)
        ])
        
        if self.enterPinCode {
            view.addSubview(signBtn)
            signBtn.easy.layout([
                Top(20).to(view.safeAreaLayoutGuide, .top), Trailing(20).to(view.safeAreaLayoutGuide, .trailing)
            ])
        }
    }
    
    func setupPasscodeTextField(){
        passcodeText.text = headerTitle
        passcode.becomeFirstResponder()
        passcode.didFinishedEnterCode = { code in
            let pinCode = code
            if pinCode.count == 4 {
                if self.enterPinCode  {
                    if let window = UIApplication.shared.windows.first {
                        
                        if pinCode == AccountUserDefaults.shared.getPinCodeApp() {
                            window.rootViewController = TabBarController()
                            window.makeKeyAndVisible()
                        } else {
                            self.passcode.shake()
                            self.passcode.clear()
                            self.passcode.becomeFirstResponder()
                        }
                    }
                } else {
                    if !self.repeatPinCode {
                        let vc = EnterPinCodeVC()
                        vc.headerTitle = "repeat_code"
                        vc.firstPinCode = pinCode
                        vc.repeatPinCode = true
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    } else {
                        AccountUserDefaults.shared.savePinCodeApp(pinCode: pinCode)
                        guard var currentVCStack = self.navigationController?.viewControllers else { return }
                        currentVCStack.remove(at: currentVCStack.count - 2)
                        self.navigationController?.setViewControllers(currentVCStack, animated: true)
                        self.navigationController?.popViewController(animated: true)
                        self.navigationController?.navigationBar.barStyle = .default
                    }
                }
            }
        }
    }
    
    func alertTouchID() {
        let alertController = UIAlertController(title: "warning", message: "biometrics_not_found", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "enter_password", style: .default, handler: nil)
        alertController.addAction(alertAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }

    @objc func fingerprintBtnClick() {
        let context = LAContext()
        var error: NSError? = nil
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "TouchID or FaceID check for opening an application"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { succes, error in
                    DispatchQueue.main.async {
                        guard succes, error == nil else { return }
                            
                        if let window = UIApplication.shared.windows.first {
                            window.rootViewController = TabBarController()
                            window.makeKeyAndVisible()
                        }
                    }
                }
            } else {
                alertTouchID()
        }
    }
    
    
    @objc func backBtnClick() {
        self.navigationController?.popViewController(animated: true)
    }
}
