//
//  Pin.swift
//  Salam-beta
//
//  Created by Maksadow Meylis on 22.06.2022.
//

import UIKit

class Pin: UIView {

    let pin = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        pin.backgroundColor = .black
        pin.layer.cornerRadius = 7.5
        pin.layer.masksToBounds = true
        pin.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pin)

        NSLayoutConstraint.activate([
            pin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pin.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pin.widthAnchor.constraint(equalToConstant: 15.0),
            pin.heightAnchor.constraint(equalToConstant: 15.0),
            ])
    }
}
