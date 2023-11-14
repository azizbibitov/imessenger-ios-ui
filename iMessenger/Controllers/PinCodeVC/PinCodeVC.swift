//
//  PinCodeVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 13.08.2022.
//

import UIKit
import EasyPeasy

class PinCodeVC: UIViewController {
    
    static let shared = PinCodeVC()
    
    var pinView: UIView = {
        let vw = UIView()
        vw.backgroundColor = .white
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    var textPin: UILabel = {
        let lbl = UILabel()
        lbl.text = "Pin Code"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    var pinSwitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = ColorUserDefaults.shared.color.getColorInterface()
        sw.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        sw.addTarget(self, action: #selector(switchChange), for: .valueChanged)
        return sw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Pin Code"
//        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorLightGray")
        navigationItem.backBarButtonItem?.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        view.addSubview(pinView)
        pinView.easy.layout([
            Leading(20), Trailing(20), Top(20).to(view.safeAreaLayoutGuide, .top), Height(45)
        ])
        
        pinView.addSubview(textPin)
        textPin.easy.layout([
            Leading(20), Top(), Bottom()
        ])
        
        pinView.addSubview(pinSwitch)
        pinSwitch.easy.layout([
            Trailing(20), CenterY()
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pinSwitch.isOn = !AccountUserDefaults.shared.getPinCodeApp().isEmpty
    }
    
    @objc func switchChange() {
            if pinSwitch.isOn {
                let vc = EnterPinCodeVC()
                vc.headerTitle = "first_code"
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                AccountUserDefaults.shared.savePinCodeApp(pinCode: "")
        }
    }
}
