//
//  BooksTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import EasyPeasy

class BooksTableViewCell: UITableViewCell {
    
    var bookImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img4")
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        return img
    }()
    
    var bookName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    var bookDesc: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(bookImage)
        bookImage.easy.layout([
            Leading(10), Top(20), Bottom(20), Height(180), Width(120)
        ])
        
        self.contentView.addSubview(bookName)
        bookName.easy.layout([
            Leading(10).to(bookImage, .trailing), Top().to(bookImage, .top), Trailing(10)
        ])
        
        self.contentView.addSubview(bookDesc)
        bookDesc.easy.layout([
            Leading(10).to(bookImage, .trailing), Top(10).to(bookName, .bottom), Trailing(10)
        ])
}
    
    func configureBook(data: BooksModel) {
        
        bookImage.image = UIImage(named: data.bookImage)
        bookName.text = data.bookName
        bookDesc.text = data.bookDesc
        
        
    }

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
}

