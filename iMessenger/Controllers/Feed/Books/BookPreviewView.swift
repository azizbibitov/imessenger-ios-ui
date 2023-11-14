//
//  BookPreviewView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 21.08.2022.
//

import UIKit
import EasyPeasy

class BookPreviewView: UIView {

    var scrollView: UIScrollView = {
        let scr = UIScrollView()
        scr.keyboardDismissMode = .onDrag
        return scr
    }()
    
    var bookImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "book")
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        return img
    }()
    
    var bookName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Portrait Dorian Gray"
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 26, weight: .black)
        return lbl
    }()
    
    var bookDesc: UILabel = {
        let lbl = UILabel()
        lbl.text = "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 14)
        lbl.clipsToBounds = true
        return lbl
    }()
    
    var readButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        btn.setTitle("Read book", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        btn.layer.cornerRadius = 8
        btn.clipsToBounds = true
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(scrollView)
        scrollView.easy.layout([
            Leading(), Trailing(), Top(), Bottom()
        ])
        
        scrollView.addSubview(bookImage)
        bookImage.easy.layout([
            Height(180), Width(120), CenterX(), Top(20)
        ])
        
        scrollView.addSubview(bookName)
        bookName.easy.layout([
            Leading(20), Trailing(20), Top(10).to(bookImage, .bottom)
        ])
        
        scrollView.addSubview(bookDesc)
        bookDesc.easy.layout([
            Leading(20), Trailing(20), Top(10).to(bookName, .bottom), Width(UIScreen.main.bounds.width-40)
        ])
        
        scrollView.addSubview(readButton)
        readButton.easy.layout([
            Top(10).to(bookDesc, .bottom), CenterX(), Height(40), Width(110)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
