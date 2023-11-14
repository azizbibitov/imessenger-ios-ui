//
//  Model.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 17.08.2022.
//

import Foundation

struct AddUserHeaderModel {
    var addUSerHeaderText: String
}

struct DeviceModel {
    var deviceImage: String
    var deviceName: String
    var appNameAndVersion: String
}

struct ChatListModel {
    var userImage: String
    var userOnlineStatus: Bool
    var userName: String
    var userMessage: String
    var userMessageMute: String
    var userMessageDate: String
    var userMessageStatus: String
    var userMessageCountView: Bool
    var userMessageCountViewMute: Bool
}


struct ChatMessage {
    let text: String
    let isIncoming: Bool
}

struct BooksModel {
    var bookImage: String
    var bookName: String
    var bookDesc: String
}

struct MoviesModel {
    var movieImage: String
    var playIconView: Bool
    var movieName: String
    var movieDesc: String
    var movieYear: String
    var movieYearText: String
    var movieSort: String
    var movieSortText: String
}


struct MusicModel {
    var musicImage: String
    var playIcon: String
    var musicName: String
    var singerName: String
    var addIcon: String
}


struct PostsModel {
    var userImage: String
    var postDate: String
    var userName: String
    var userMoreButton: String
    var userAddButton: Bool
    var userRemoveButton: Bool
    var postImage: String
    var postLike: String
    var postComment: String
    var postShare: String
    var postLikedText: String
    var postLikedCount: String
    var postBookmark: String
    var postText: String
}


struct StoryModel {
    var storyImageIcon: Bool
    var storyImage: String
    var userName: String
}


struct AllFeedModel {
    var allfeedImage: String
    var feedTypeVideo: Bool
    var feedTypeImageDouble: Bool
}


struct ServiceModel {
    var friendsButton: String
    var friendsText: String
    var musicButton: String
    var musicText: String
    var galleryButton: String
    var galleryText: String
    var moviesButton: String
    var moviesText: String
}


struct UserInterfaceColorModel {
    var userInterfaceColor: String
    var userInterfaceColorId: Int
}
