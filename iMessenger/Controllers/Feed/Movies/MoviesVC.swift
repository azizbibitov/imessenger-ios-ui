//
//  MoviesVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import AVKit

class MoviesVC: UIViewController {
    
    var moviesData = [
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
        MoviesModel(movieImage: "film2",
                    playIconView: false,
                    movieName: "UNUTMADYM - SalamNews",
                    movieDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec bibendum nibh. Pellentesque lacinia hendrerit eros, eget congue ligula accumsan in. Ut auctor justo et risus laoreet, id aliquam ligula placerat. Vivamus vel rutrum mi. In faucibus felis lorem, bibendum tempor dui convallis vitae. Donec ac felis velit. Nunc ante nisl, porttitor sit amet aliquam vehicula, maximus vitae odio. Maecenas et libero malesuada, ultricies lectus et, semper turpis. Mauris nec elit porta ante euismod posuere eu a neque. Aenean blandit risus velit, a scelerisque orci consequat non. Donec metus tortor, ornare a ipsum sed, aliquam vestibulum risus. Proin ac dui vitae ligula imperdiet volutpat vitae at est. Proin vel tincidunt libero. Sed pellentesque felis tortor, in fermentum risus ultricies at.",
                    movieYear: "Year: ",
                    movieYearText: "2022",
                    movieSort: "Genre: ",
                    movieSortText: "Boyevik, Voyna"),
    ]
    
    var mainView: MoviesView {
        return view as! MoviesView
    }
    
    override func loadView() {
        super.loadView()
        
        view = MoviesView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorBackground")
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        print ("all feed refresh")
        DispatchQueue.main.async {
            self.mainView.tableView.refreshControl?.endRefreshing()
        }
    }
}

extension MoviesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        cell.configureMovies(data: moviesData[indexPath.row])
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        
        cell.movieImageCallback = { [weak self] in
            let videoURL = "https://salamnews.tm/api/media/uploads/gallery/video/166video/0-1659630094578.mp4"
            let player = AVPlayer(url: URL(fileURLWithPath: videoURL))
            let playerController = AVPlayerViewController()
            playerController.player = player
            playerController.allowsPictureInPicturePlayback = true
            self?.present(playerController, animated: true) {
                player.play()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
