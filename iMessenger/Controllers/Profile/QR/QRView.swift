//
//  QRView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class QRView: UIView {
    
    var myQrCodeImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "qrcode")
        return img
    }()
    
    var scanQrCode: UIButton = {
        let btn = UIButton()
        btn.setTitle(" Scan QR Code", for: .normal)
        btn.setTitleColor(ColorUserDefaults.shared.color.getColorInterface(), for: .normal)
        btn.titleLabel!.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12
        btn.clipsToBounds = true
        return btn
    }()
    
    var myQrCodeBottomText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Scan the QR Code to find your friends!"
        lbl.textColor = .lightGray.withAlphaComponent(0.7)
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if #available(iOS 15.0, *) {
        self.addSubview(myQrCodeImage)
        myQrCodeImage.easy.layout([
            CenterX(), Top(40).to(safeAreaLayoutGuide, .top), Size(180)
        ])
        
        self.addSubview(scanQrCode)
        scanQrCode.easy.layout([
            CenterX(), Top(20).to(myQrCodeImage, .bottom), Height(50), Width(UIScreen.main.bounds.width-100)
        ])
        
        self.addSubview(myQrCodeBottomText)
        myQrCodeBottomText.easy.layout([
            CenterX(), Top(10).to(scanQrCode, .bottom), Width(UIScreen.main.bounds.width-40)
        ])
        } else {
            self.addSubview(myQrCodeImage)
            myQrCodeImage.easy.layout([
                CenterX(), Top(40).to(safeAreaLayoutGuide, .top), Size(250)
            ])
            
            self.addSubview(scanQrCode)
            scanQrCode.easy.layout([
                CenterX(), Top(40).to(myQrCodeImage, .bottom), Height(55), Width(UIScreen.main.bounds.width-80)
            ])
            
            self.addSubview(myQrCodeBottomText)
            myQrCodeBottomText.easy.layout([
                CenterX(), Top(20).to(scanQrCode, .bottom), Width(UIScreen.main.bounds.width/2)
            ])
        }
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
