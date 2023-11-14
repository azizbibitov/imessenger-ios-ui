//
//  PostVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit

class PostVC: UIViewController, ControllerTitle {
    
    static var title: String { return "My Posts" }
    static var image: String { return "rectangle.grid.1x2" }
    
    var portraitPost = CGFloat(425)
    var albumPost = CGFloat(235)
    
    var postData = [
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: true,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: true,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: true,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: true,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: true,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
        PostsModel(userImage: "user2",
                   postDate: "Aug 21, 2022",
                   userName: "Mekan Designer",
                   userMoreButton: "more-horizontal",
                   userAddButton: false,
                   userRemoveButton: true,
                   postImage: "img1",
                   postLike: "like",
                   postComment: "comment",
                   postShare: "share-airplane",
                   postLikedText: "Liked:",
                   postLikedCount: "238",
                   postBookmark: "bookmark",
                   postText: "Karoche yzdarowcylykmow adamlar karoce men yaramok hemem shol men ukyda shu vagt onsan bu test teks bary yogy cell-in uzynlygyny automatic sazlayamy sazlanokmy barlamak ucin yazdym tak chto mana icgilidir yada kelle gowy daldir oytman men psihiatrdan 100% bolup gecdim"),
    ]
    
    var mainView: PostView {
        return view as! PostView
    }
    
    override func loadView() {
        super.loadView()
        
        view = PostView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Posts"
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
    
    
    @objc func handleRefreshControl() {
        print ("home refresh")
        DispatchQueue.main.async {
            self.mainView.tableView.refreshControl?.endRefreshing()
        }
    }
}

extension PostVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postsTableViewCell", for: indexPath) as! PostsTableViewCell
        cell.configurePost(data: postData[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        
        cell.userMoreButtonCallBack = { [weak self] in
        let optionMenu = UIAlertController(title: nil, message: "Post Settings", preferredStyle: .actionSheet)

        let saveAction = UIAlertAction(title: "Save file", style: .default, handler: {
               (alert: UIAlertAction!) -> Void in
        })
            
        let deleteAction = UIAlertAction(title: "Update", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
        })
           
        let updateAction = UIAlertAction(title: "Copy Link", style: .default, handler: {
               (alert: UIAlertAction!) -> Void in
        })
            
        let complainAction = UIAlertAction(title: "Complain", style: .destructive, handler: {
                (alert: UIAlertAction!) -> Void in
        })
           
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
               (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(updateAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(complainAction)
        optionMenu.addAction(cancelAction)
        self?.present(optionMenu, animated: true, completion: nil)
        }
        
        cell.postCommentCallback = { [weak self] in
            let vc = PostCommentVC()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.postShareCallback = { [weak self] in
            let vc = PostCommentVC()
            self?.present(vc, animated: true, completion: nil)
        }
        
        cell.postImageLikeCallBack = { [weak self] in
            cell.likeImageIsHidden.isHidden = false
            cell.isSelectedLike = false
            cell.postLike.tintColor = .systemRed
            cell.postLike.image = UIImage(named: "like-fill")?.withRenderingMode(.alwaysTemplate)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            cell.likeImageIsHidden.isHidden = true
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
