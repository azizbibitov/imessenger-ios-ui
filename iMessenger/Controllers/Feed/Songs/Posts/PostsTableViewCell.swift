//
//  PostsTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import EasyPeasy

class PostsTableViewCell: UITableViewCell {
    
    var portraitPost = CGFloat(425)
    var albumPost = CGFloat(245)
    var postWidth = UIScreen.main.bounds.width
    
    var isSelectedLike = false
    var isSelectedBookmark = false
    
    var userImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 35/2
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    var userName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    var postDate: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    var userMoreButton: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorWhiteBlackText")
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var userAddButton: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = ColorUserDefaults.shared.color.getColorInterface().withAlphaComponent(0.7)
        lbl.textColor = .white
        lbl.text = "Add"
        lbl.textAlignment = .center
        lbl.clipsToBounds = true
        lbl.font = .systemFont(ofSize: 14)
        lbl.layer.cornerRadius = 6
        return lbl
    }()
    
    var userRemoveButton: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .systemRed.withAlphaComponent(0.7)
        lbl.textColor = .white
        lbl.text = "Remove"
        lbl.clipsToBounds = true
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14)
        lbl.layer.cornerRadius = 6
        return lbl
    }()
    
    
    var postImage: ZoomableImageView = {
        let img = ZoomableImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        return img
    }()
    
    var postLike: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorDarkGray")
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var postComment: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorDarkGray")
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var postShare: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorDarkGray")
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var postBookmark: UIImageView = {
        let img = UIImageView()
        img.tintColor = UIColor(named: "colorDarkGray")
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var postLikedText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var postLikedCount: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var postTextLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var postAuthor: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.numberOfLines = 1
        lbl.text = "Mekan Designer: "
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    var postText: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        lbl.font = .systemFont(ofSize: 14)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    var likeImageIsHidden: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "postGestureLike")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.isHidden = true
        return img
    }()
    
    var postImageCallback: ( ()->Void )?
    var postCommentCallback: ( ()->Void )?
    var postShareCallback: ( ()->Void )?
    var postImageLikeCallBack: ( ()->Void )?
    var userMoreButtonCallBack: ( ()->Void )?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(postImageTap))
        gesture.numberOfTapsRequired = 2
        postImage.addGestureRecognizer(gesture)
        userMoreButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userMoreButtonTap)))
        postLike.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(postLikeTap)))
        postComment.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(postCommentTap)))
        postShare.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(postShareTap)))
        postBookmark.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(postBookmarkTap)))
    
        self.contentView.addSubview(userImage)
        userImage.easy.layout([
            Leading(15), Top(20), Size(35)
        ])
        
        self.contentView.addSubview(userName)
        userName.easy.layout([
            Leading(10).to(userImage, .trailing), Top().to(userImage, .top), Trailing(50)
        ])
        
        self.contentView.addSubview(postDate)
        postDate.easy.layout([
            Leading(10).to(userImage, .trailing), Top().to(userName, .bottom), Trailing(50)
        ])
        
        self.contentView.addSubview(userMoreButton)
        userMoreButton.easy.layout([
            Trailing(15), CenterY().to(userImage, .centerY)
        ])
        
        self.contentView.addSubview(userAddButton)
        userAddButton.easy.layout([
            CenterY().to(userImage, .centerY), Height(26), Width(65), Trailing(7).to(userMoreButton, .leading)
        ])
        
        self.contentView.addSubview(userRemoveButton)
        userRemoveButton.easy.layout([
            CenterY().to(userImage, .centerY), Height(26), Width(65), Trailing(7).to(userMoreButton, .leading)
        ])
        
        
        self.contentView.addSubview(postImage)
        postImage.easy.layout([
            Leading(), Trailing(), Width(postWidth), Top(7).to(userImage, .bottom), Height(albumPost),
        ])
        
        postImage.addSubview(likeImageIsHidden)
        likeImageIsHidden.easy.layout([
            Center(), Size(60)
        ])
        
        self.contentView.addSubview(postLike)
        postLike.easy.layout([
            Leading(15), Top(10).to(postImage, .bottom), Size(24)
        ])
        
        self.contentView.addSubview(postComment)
        postComment.easy.layout([
            Leading(10).to(postLike, .trailing), Top().to(postLike, .top), Size(24)
        ])
        
        self.contentView.addSubview(postShare)
        postShare.easy.layout([
            Leading(10).to(postComment, .trailing), Top().to(postLike, .top), Size(24)
        ])
        
        self.contentView.addSubview(postBookmark)
        postBookmark.easy.layout([
            Trailing(15), Top().to(postLike, .top), Size(24)
        ])
        
        self.contentView.addSubview(postLikedText)
        postLikedText.easy.layout([
            Top(10).to(postLike, .bottom), Leading(15)
        ])
        
        self.contentView.addSubview(postLikedCount)
        postLikedCount.easy.layout([
            Top().to(postLikedText, .top), Leading(4).to(postLikedText, .trailing)
        ])
        
        self.contentView.addSubview(postText)
        postText.easy.layout([
            Top(10).to(postLikedText, .bottom), Bottom(20), Leading(15), Trailing(15), Width(UIScreen.main.bounds.width)
        ])
    }
    
    func configurePost(data: PostsModel) {
        
        userImage.image = UIImage(named: data.userImage)
        userName.text = data.userName
        postDate.text = data.postDate
        userAddButton.isHidden = data.userAddButton
        userRemoveButton.isHidden = data.userRemoveButton
        postImage.image = UIImage(named: data.postImage)
        postLike.image = UIImage(named: data.postLike)?.withRenderingMode(.alwaysTemplate)
        postComment.image = UIImage(named: data.postComment)?.withRenderingMode(.alwaysTemplate)
        postShare.image = UIImage(named: data.postShare)?.withRenderingMode(.alwaysTemplate)
        postBookmark.image = UIImage(named: data.postBookmark)?.withRenderingMode(.alwaysTemplate)
        userMoreButton.image = UIImage(named: data.userMoreButton)?.withRenderingMode(.alwaysTemplate)
        postLikedText.text = data.postLikedText
        postLikedCount.text = data.postLikedCount
        postText.text = "\(postAuthor.text!)\(data.postText)"
        
    }
    
    @objc func userMoreButtonTap() {
        userMoreButtonCallBack?()
    }
    
    @objc func postImageTap() {
        postImageLikeCallBack?()
    }
    
    @objc func postCommentTap() {
        postCommentCallback?()
    }
    
    
    @objc func postShareTap() {
        postShareCallback?()
    }
    
    
    @objc func postLikeTap() {
        if isSelectedLike {
            isSelectedLike = false
            postLike.tintColor = UIColor(named: "colorDarkGray")
            postLike.image = UIImage(named: "like")?.withRenderingMode(.alwaysTemplate)
        }
        else {
            isSelectedLike = true
            postLike.tintColor = .systemRed
            postLike.image = UIImage(named: "like-fill")?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    @objc func postBookmarkTap() {
        if isSelectedBookmark {
            isSelectedBookmark = false
            postBookmark.tintColor = UIColor(named: "colorDarkGray")
            postBookmark.image = UIImage(named: "bookmark")?.withRenderingMode(.alwaysTemplate)
        }
        else {
            isSelectedBookmark = true
            postBookmark.tintColor = UIColor(named: "colorDarkGray")
            postBookmark.image = UIImage(named: "bookmark-fill")?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
