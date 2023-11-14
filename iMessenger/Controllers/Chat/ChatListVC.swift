//
//  ChatListViewVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 12.08.2022.
//

import UIKit
import EasyPeasy

class ChatListVC: UIViewController, UISearchResultsUpdating, ContextMenu {

    let searchController = UISearchController(searchResultsController: nil)
    
    var storyDataImage = [
        StoryModel(storyImageIcon: false, storyImage: "", userName: "My Story"),
        StoryModel(storyImageIcon: true, storyImage: "img2", userName: "designtm11"),
        StoryModel(storyImageIcon: true, storyImage: "img3", userName: "kmd_gulsenem"),
        StoryModel(storyImageIcon: true, storyImage: "img4", userName: "menli21"),
        StoryModel(storyImageIcon: true, storyImage: "img5", userName: "tawuska77"),
        StoryModel(storyImageIcon: true, storyImage: "img6", userName: "g.gurbanowa"),
        StoryModel(storyImageIcon: true, storyImage: "img2", userName: "designtm11"),
        StoryModel(storyImageIcon: true, storyImage: "img3", userName: "kmd_gulsenem"),
        StoryModel(storyImageIcon: true, storyImage: "img4", userName: "menli21"),
        StoryModel(storyImageIcon: true, storyImage: "img5", userName: "tawuska77"),
        StoryModel(storyImageIcon: true, storyImage: "img6", userName: "g.gurbanowa"),
    ]
    
    var chatListModel = [
        ChatListModel(userImage: "user1",
                      userOnlineStatus: true,
                      userName: "Mekan Designer",
                      userMessage: "Dasyndan is alyp bolmayamay",
                      userMessageMute: "volume-mute",
                      userMessageDate: "17:12",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: false),
        ChatListModel(userImage: "user2",
                      userOnlineStatus: false,
                      userName: "Begenc Gundogdyyew",
                      userMessage: "Ahli harby bolumleri barlan!",
                      userMessageMute: "",
                      userMessageDate: "16:38",
                      userMessageStatus: "",
                      userMessageCountView: false,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user3",
                      userOnlineStatus: false,
                      userName: "Cary SalamNews",
                      userMessage: "Yaramok bu gun baryp bilmerin men ise",
                      userMessageMute: "",
                      userMessageDate: "16:02",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user4",
                      userOnlineStatus: true,
                      userName: "Shahruh Hindistan",
                      userMessage: "Hacan gelyan?",
                      userMessageMute: "",
                      userMessageDate: "15:44",
                      userMessageStatus: "read3",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user5",
                      userOnlineStatus: true,
                      userName: "Meredaly Salam",
                      userMessage: "Habar yok name boldy.",
                      userMessageMute: "",
                      userMessageDate: "15:32",
                      userMessageStatus: "read1",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user6",
                      userOnlineStatus: true,
                      userName: "Guwandyk Atajanow",
                      userMessage: "Yatayynow menem indi",
                      userMessageMute: "",
                      userMessageDate: "15:01",
                      userMessageStatus: "read2",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user7",
                      userOnlineStatus: true,
                      userName: "Kakajan Mash",
                      userMessage: "Karz pul yokmay",
                      userMessageMute: "volume-mute",
                      userMessageDate: "14:54",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: false),
        ChatListModel(userImage: "img5",
                      userOnlineStatus: true,
                      userName: "Juma Kamera",
                      userMessage: "sonkydan goray ba sontayda",
                      userMessageMute: "volume_mute",
                      userMessageDate: "14:38",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "img4",
                      userOnlineStatus: true,
                      userName: "Nury Bedew",
                      userMessage: "✊😜👋",
                      userMessageMute: "",
                      userMessageDate: "12:51",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user1",
                      userOnlineStatus: true,
                      userName: "Mekan Designer",
                      userMessage: "Dasyndan is alyp bolmayamay",
                      userMessageMute: "volume-mute",
                      userMessageDate: "17:12",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: false),
        ChatListModel(userImage: "user2",
                      userOnlineStatus: false,
                      userName: "Begenc Gundogdyyew",
                      userMessage: "Ahli harby bolumleri barlan!",
                      userMessageMute: "",
                      userMessageDate: "16:38",
                      userMessageStatus: "",
                      userMessageCountView: false,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user3",
                      userOnlineStatus: false,
                      userName: "Cary SalamNews",
                      userMessage: "Yaramok bu gun baryp bilmerin men ise",
                      userMessageMute: "",
                      userMessageDate: "16:02",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user4",
                      userOnlineStatus: true,
                      userName: "Shahruh Hindistan",
                      userMessage: "Hacan gelyan?",
                      userMessageMute: "",
                      userMessageDate: "15:44",
                      userMessageStatus: "read3",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user5",
                      userOnlineStatus: true,
                      userName: "Meredaly Salam",
                      userMessage: "Habar yok name boldy.",
                      userMessageMute: "",
                      userMessageDate: "15:32",
                      userMessageStatus: "read1",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user6",
                      userOnlineStatus: true,
                      userName: "Guwandyk Atajanow",
                      userMessage: "Yatayynow menem indi",
                      userMessageMute: "",
                      userMessageDate: "15:01",
                      userMessageStatus: "read2",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "user7",
                      userOnlineStatus: true,
                      userName: "Kakajan Mash",
                      userMessage: "Karz pul yokmay",
                      userMessageMute: "volume-mute",
                      userMessageDate: "14:54",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: false),
        ChatListModel(userImage: "img5",
                      userOnlineStatus: true,
                      userName: "Juma Kamera",
                      userMessage: "sonkydan goray ba sontayda",
                      userMessageMute: "volume-mute",
                      userMessageDate: "14:38",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
        ChatListModel(userImage: "img4",
                      userOnlineStatus: true,
                      userName: "Nury Bedew",
                      userMessage: "✊😜👋",
                      userMessageMute: "",
                      userMessageDate: "12:51",
                      userMessageStatus: "",
                      userMessageCountView: true,
                      userMessageCountViewMute: true),
       
    ]
    
    var mainView: ChatListView {
        return view as! ChatListView
    }
    
    override func loadView() {
        super.loadView()
        
        view = ChatListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.backgroundColor = .clear
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.allowsMultipleSelectionDuringEditing = true
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        
        view.backgroundColor = UIColor(named: "colorBackground")
        
        navigationItem.title = "Chat"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "bell"), style: .plain, target: self, action: #selector(bellButtonTapped))
        leftBarButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "mail-inbox"), style: .plain, target: self, action: #selector(inboxButtonTapped))
        rightBarButton.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationItem.rightBarButtonItem = rightBarButton
        
        mainView.tableView.reloadData()
        mainView.collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    @objc func bellButtonTapped() {
        let vc = NotificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func inboxButtonTapped() {
        let vc = ChatInboxVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleRefreshControl() {
        print ("home refresh")
        DispatchQueue.main.async {
            self.mainView.tableView.refreshControl?.endRefreshing()
            self.mainView.tableView.reloadData()
            self.mainView.collectionView.reloadData()
        }
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {

    }

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }

    @objc func editButtonItemTapped() {
//        if mainView.tableView.isEditing {
//        mainView.tableView.isEditing = false
//        } else {
//            mainView.tableView.isEditing = true
//        }
    }

}

extension ChatListVC: UITableViewDelegate, UITableViewDataSource {

    @available(iOS 13.0, *)
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            return self.makeDefaultMenu()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatListModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        cell.configureChatList(data: chatListModel[indexPath.row])
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        
        cell.userMessageCountView.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        cell.userOnlineStatus.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        cell.userMessageStatus.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ChatRoomVC()
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let leadingSwipeRead = UIContextualAction(style: .normal,
                                        title: nil) { [weak self] (leadingSwipeRead, view, completionHandler) in
                                            self?.swipeRightMute()
                                            completionHandler(true)
        }
        leadingSwipeRead.backgroundColor = .systemBlue
        if #available(iOS 13.0, *) {
            leadingSwipeRead.image = UIImage(systemName: "text.bubble.fill")
        } else {
            leadingSwipeRead.image = UIImage(named: "text.bubble.fill")
        }
        
        let leadingSwipePinned = UIContextualAction(style: .normal,
                                        title: nil) { [weak self] (leadingSwipeRead, view, completionHandler) in
                                            self?.swipeRightMute()
                                            completionHandler(true)
        }
        leadingSwipePinned.backgroundColor = .systemGreen
        if #available(iOS 13.0, *) {
            leadingSwipePinned.image = UIImage(systemName: "pin.fill")
        } else {
            leadingSwipePinned.image = UIImage(named: "pin.fill")
        }

        let configure = UISwipeActionsConfiguration(actions: [leadingSwipeRead, leadingSwipePinned])
        configure.performsFirstActionWithFullSwipe = false
        return configure
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trailingSwipeMute = UIContextualAction(style: .normal,
                                        title: nil) { [weak self] (trailingSwipeMute, view, completionHandler) in
                                            self?.swipeRightMute()
                                            completionHandler(true)
        }
        trailingSwipeMute.backgroundColor = .systemOrange
        if #available(iOS 13.0, *) {
            trailingSwipeMute.image = UIImage(systemName: "speaker.slash.fill")
        } else {
            trailingSwipeMute.image = UIImage(named: "speaker.slash.fill")
        }
        
        let trailingSwipeTrash = UIContextualAction(style: .normal,
                                        title: nil) { [weak self] (trailingSwipeTrash, view, completionHandler) in
                                            self?.swipeRightDelete()
                                            completionHandler(true)
        }
        trailingSwipeTrash.backgroundColor = .systemRed
        if #available(iOS 13.0, *) {
            trailingSwipeTrash.image = UIImage(systemName: "trash.fill")
        } else {
            trailingSwipeTrash.image = UIImage(named: "trash.fill")
        }
        
        let configure = UISwipeActionsConfiguration(actions: [trailingSwipeTrash, trailingSwipeMute])
        configure.performsFirstActionWithFullSwipe = false
        return configure
    }
    
    private func swipeRightMute() {
        print("Marked as Mute")
    }

    private func swipeRightDelete() {
        
        let alert = UIAlertController(title: "Mekan Designer", message: "Are you really going to delete this chat?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        chatListModel.swapAt(sourceIndexPath.row, destinationIndexPath.row)
//    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            tableView.beginUpdates()
//            chatListModel.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//    }
}

extension ChatListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension ChatListVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storyDataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
        return UICollectionViewCell() }
        cell.configureStory(data: storyDataImage[indexPath.row])
        
        cell.storyImageBG.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        cell.storyImage.backgroundColor = ColorUserDefaults.shared.color.getColorInterface()
        
        return cell
    }
}

extension ChatListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = StoryVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}

extension ChatListVC: UICollectionViewDelegateFlowLayout {
    
}
