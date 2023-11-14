//
//  StoryView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import UIKit
import EasyPeasy

class StoryView: UIView, UIGestureRecognizerDelegate, SegmentedProgressBarDelegate {
    
    var spb = SegmentedProgressBar(numberOfSegments: 6, duration: 4.0)
    
    var iv: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let images = [
        UIImage(named: "img4"),
        UIImage(named: "img3"),
        UIImage(named: "img2"),
        UIImage(named: "img1"),
        UIImage(named: "img5"),
        UIImage(named: "book"),
    ]
    
    var userImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 35/2
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.image = UIImage(named: "img2")
        img.isUserInteractionEnabled = true
        return img
    }()

    var userName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "designtm11"
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()

    var storyDate: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "Aug 25, 2022"
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()

    var userMoreButton: UIButton = {
        let btn = UIButton()
        if #available(iOS 13.0, *) {
            btn.setImage(UIImage(systemName: "ellipsis")?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        btn.tintColor = .white
        btn.isUserInteractionEnabled = true
        return btn
    }()
    
    var storyClose: UIImageView = {
        let img = UIImageView()
        if #available(iOS 13.0, *) {
            img.image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        } else {
            // Fallback on earlier versions
        }
        img.tintColor = .white
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var screenView = UIView()
    
    var userMoreButtonCallback: ( ()->Void )?
    var closeStoryButtonCallback: ( ()->Void )?
    var storyDidFinishedCallback: ( ()->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stopStory = UILongPressGestureRecognizer(target: self, action: #selector(screenLongPress))
        stopStory.minimumPressDuration = 0.3
        stopStory.delaysTouchesBegan = true
        stopStory.delegate = self
        screenView.addGestureRecognizer(stopStory)
        
        self.addSubview(spb)
        spb.easy.layout([
            Leading(10), Trailing(10), Top().to(safeAreaLayoutGuide, .top), Width(UIScreen.main.bounds.width-30), Height(2)
        ])
        
        self.addSubview(iv)
        
        iv.frame = self.bounds
        
        self.addSubview(userImage)
        userImage.easy.layout([
            Leading(10), Size(35), Top(10).to(spb, .bottom)
        ])
        
        
        self.addSubview(userName)
        userName.easy.layout([
            Top(2).to(userImage, .top), Leading(10).to(userImage, .trailing)
        ])

        self.addSubview(storyDate)
        storyDate.easy.layout([
            Top().to(userName, .bottom), Leading().to(userName, .leading)
        ])

        self.addSubview(storyClose)
        storyClose.easy.layout([
            Trailing(10), CenterY().to(userImage, .centerY), Height(24), Width(22)
        ])

        self.addSubview(userMoreButton)
        userMoreButton.easy.layout([
            CenterY().to(storyClose, .centerY), Height(24), Width(25), Trailing(10).to(storyClose, .leading)
        ])
        
        screenView.backgroundColor = .clear
        self.addSubview(screenView)
        screenView.easy.layout([
            Leading(), Trailing(), Bottom().to(safeAreaLayoutGuide, .bottom), Top(5).to(userImage, .bottom)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.spb.startAnimation()
            }
        
        updateImage(index: 0)

        spb.delegate = self
        spb.topColor = .white
        spb.bottomColor = .white.withAlphaComponent(0.25)
        spb.padding = 2
        
        storyClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(storyCloseTap)))
        userName.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userDataTap)))
        userImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userDataTap)))
        userMoreButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userMoreButtonTap)))
        
    }
    
    func segmentedProgressBarChangedIndex(index: Int) {
        updateImage(index: index)
    }
    
    func segmentedProgressBarFinished() {
        storyDidFinishedCallback?()
    }
    
    func updateImage(index: Int) {
        iv.image = images[index]
    }
    
    @objc func tappedView() {
        spb.isPaused = !spb.isPaused
    }
    
    @objc func storyCloseTap() {
        closeStoryButtonCallback?()
    }
    
    @objc func userDataTap() {
        print("basyldy user data")
    }
    
    @objc func userMoreButtonTap() {
        userMoreButtonCallback?()
    }
    
    @objc func screenLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            spb.isPaused = true
            UIView.animate(withDuration: 0.5) {
                self.spb.alpha = 0
                self.userImage.alpha = 0
                self.userMoreButton.alpha = 0
                self.userName.alpha = 0
                self.storyClose.alpha = 0
                self.storyDate.alpha = 0
            }
        }
        else {
            spb.isPaused = false
            UIView.animate(withDuration: 0.1) {
                self.spb.alpha = 1
                self.userImage.alpha = 1
                self.userMoreButton.alpha = 1
                self.userName.alpha = 1
                self.storyClose.alpha = 1
                self.storyDate.alpha = 1
            }
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
