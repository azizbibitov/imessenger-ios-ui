//
//  AllFeedView.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 14.08.2022.
//

import UIKit
import EasyPeasy

class AllFeedView: UIView {
    
    var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumInteritemSpacing = 1
        collectionLayout.minimumLineSpacing = 1
        collectionLayout.collectionView?.refreshControl?.endRefreshing()
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/3-1, height: UIScreen.main.bounds.width/3-1)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.backgroundColor = .none
        collection.refreshControl = UIRefreshControl()
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(AllFeedCollectionViewCell.self, forCellWithReuseIdentifier: "allFeedCollectionViewCell")
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collectionView)
        collectionView.easy.layout([
            Leading(), Trailing(), Top(2), Bottom().to(safeAreaLayoutGuide, .bottom)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
