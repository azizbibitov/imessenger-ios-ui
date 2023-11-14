//
//  AppearanceView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit
import EasyPeasy

class MyScrollView: UIScrollView {
    var priorOffset = CGPoint.zero

    override func layoutSubviews() {
        var offset = contentOffset

        if offset.y < priorOffset.y {
            let yMax = contentSize.height - bounds.height
            if offset.y < yMax {
                offset.y = priorOffset.y
                contentOffset = offset
            }
        }
        priorOffset = offset

        super.layoutSubviews()
    }
}

class AppearanceView: UIView {
    
    var scrollView: MyScrollView = {
        let scrl = MyScrollView()
        scrl.backgroundColor = .clear
        return scrl
    }()
    
    var darkModeView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    var darkModeText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Dark Mode"
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    var darkModeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.isUserInteractionEnabled = true
        sw.onTintColor = ColorUserDefaults.shared.color.getColorInterface()
        sw.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        return sw
    }()
    
    var selectYourColorView: UIView = {
        let vw = UIView()
        vw.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        vw.layer.cornerRadius = 12
        vw.clipsToBounds = true
        return vw
    }()
    
    var selectYourColorText: UILabel = {
        let lbl = UILabel()
        lbl.text = "Select your interface color"
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumInteritemSpacing = 0
        collectionLayout.minimumLineSpacing = 7
        collectionLayout.scrollDirection = .horizontal
        collectionLayout.itemSize = CGSize(width: 60, height: 60)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(AppearanceCollectionViewCell.self, forCellWithReuseIdentifier: "appearanceCollectionViewCell")
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
        scrollView.easy.layout([
            Leading(), Trailing(), Bottom(), Top()
        ])
        
        scrollView.addSubview(darkModeView)
        darkModeView.easy.layout([
            Leading(20), Trailing(20), Top(10), Width(UIScreen.main.bounds.width-40), Height(45)
        ])
        
        darkModeView.addSubview(darkModeText)
        darkModeText.easy.layout([
            Leading(10), CenterY()
        ])
        
        darkModeView.addSubview(darkModeSwitch)
        darkModeSwitch.easy.layout([
            Trailing(10), CenterY()
        ])
        
        self.addSubview(selectYourColorView)
        selectYourColorView.easy.layout([
            Leading(20), Trailing(20), Top(20).to(darkModeView, .bottom), Width(UIScreen.main.bounds.width-40)
        ])
        
        selectYourColorView.addSubview(selectYourColorText)
        selectYourColorText.easy.layout([
            Top(10), Leading(10)
        ])
        
        selectYourColorView.addSubview(collectionView)
        collectionView.easy.layout([
            Leading(), Trailing(), Bottom(10), Top(10).to(selectYourColorText, .bottom), Height(60)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
