//
//  AllFeedCollectionViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 14.08.2022.
//

import UIKit
import EasyPeasy

class AllFeedCollectionViewCell: UICollectionViewCell {
    
    var allFeedImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.backgroundColor = .lightGray
        return img
    }()
    
    var feedTypeImageDouble: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        img.image = UIImage(named: "imagefile")?.withRenderingMode(.alwaysTemplate)
        return img
    }()
    
    var feedTypeVideo: UIImageView = {
        let img = UIImageView()
        img.tintColor = .white
        img.image = UIImage(named: "videofile")?.withRenderingMode(.alwaysTemplate)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        allFeedImage.frame = contentView.bounds
        contentView.addSubview(allFeedImage)
        
        allFeedImage.addSubview(feedTypeImageDouble)
        feedTypeImageDouble.easy.layout([
            Top(5), Trailing(5), Size(24)
        ])
        
        allFeedImage.addSubview(feedTypeVideo)
        feedTypeVideo.easy.layout([
            Top(5), Trailing(5), Size(24)
        ])
    }
    
    func configureAllFeed(data: AllFeedModel) {
        allFeedImage.image = UIImage(named: data.allfeedImage)
        feedTypeImageDouble.isHidden = data.feedTypeImageDouble
        feedTypeVideo.isHidden = data.feedTypeVideo
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
