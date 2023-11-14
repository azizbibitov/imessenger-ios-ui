//
//  SongVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit

class SongVC: UIViewController, ControllerTitle {
    
    static var title: String { return "My Songs" }
    static var image: String { return "music.note.list" }
    
    var musicData = [
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
            MusicModel(musicImage: "img6",
                       playIcon: "play",
                       musicName: "Sen al canimi",
                       singerName: "Ibrahim Tatlises",
                       addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
        MusicModel(musicImage: "img6",
                   playIcon: "play",
                   musicName: "Sen al canimi",
                   singerName: "Ibrahim Tatlises",
                   addIcon: "add.fill"),
    ]
    
    var mainView: SongView {
        return view as! SongView
    }
    
    override func loadView() {
        super.loadView()
        
        view = SongView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Songs"
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
    }
    
    @objc func handleRefreshControl() {
        print ("all feed refresh")
        DispatchQueue.main.async {
            self.mainView.tableView.refreshControl?.endRefreshing()
        }
    }
}

extension SongVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songsTableViewCell", for: indexPath) as! SongsTableViewCell
        cell.configureMusic(data: musicData[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
