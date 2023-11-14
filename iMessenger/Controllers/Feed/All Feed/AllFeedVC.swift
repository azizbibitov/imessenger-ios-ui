//
//  AllFeedVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 14.08.2022.
//

import UIKit

class AllFeedVC: UIViewController, ContextMenu {
    
    var allFeedDataImage = [
        AllFeedModel(allfeedImage: "img1", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img2", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img3", feedTypeVideo: false, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img4", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img5", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img6", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img7", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user1", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "user2", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "user3", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user4", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user5", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "user6", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user7", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img1", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img2", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img3", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img4", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img5", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img6", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img7", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user1", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user2", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "user3", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "user4", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user5", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user6", feedTypeVideo: true, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "user7", feedTypeVideo: false, feedTypeImageDouble: true),
        AllFeedModel(allfeedImage: "img1", feedTypeVideo: true, feedTypeImageDouble: false),
        AllFeedModel(allfeedImage: "img2", feedTypeVideo: true, feedTypeImageDouble: true)
    ]
    
    var mainView: AllFeedView {
        return view as! AllFeedView
    }
    
    override func loadView() {
        super.loadView()
        
        view = AllFeedView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorBackground")
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
    
    @objc func handleRefreshControl() {
        print ("all feed refresh")
        DispatchQueue.main.async {
            self.mainView.collectionView.refreshControl?.endRefreshing()
        }
    }
}

extension AllFeedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    @available(iOS 13.0, *)
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            return self.makeDefaultMenu()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFeedDataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allFeedCollectionViewCell", for: indexPath) as! AllFeedCollectionViewCell
        cell.configureAllFeed(data: allFeedDataImage[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PostVC()
        vc.navigationItem.title = "Posts"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
