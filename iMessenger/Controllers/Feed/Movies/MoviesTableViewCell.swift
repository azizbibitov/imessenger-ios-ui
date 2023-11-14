//
//  MoviesTableViewCell.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit
import EasyPeasy

class MoviesTableViewCell: UITableViewCell {
    
    var movieImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var playIconView: UIView = {
        let vw = UIView()
        vw.backgroundColor = ColorUserDefaults.shared.color.getColorInterface().withAlphaComponent(0.3)
        vw.layer.cornerRadius = 50/2
        vw.clipsToBounds = true
        return vw
    }()
    
    var playIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "play")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white
        img.isUserInteractionEnabled = true
        return img
    }()
    
    var movieName: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        return lbl
    }()
    
    var movieDesc: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        lbl.textColor = .lightGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    var movieYear: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        return lbl
    }()
    
    var movieYearText: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var movieSort: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.textColor = UIColor(named: "colorWhiteBlackText")
        return lbl
    }()
    
    var movieSortText: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .regular)
        lbl.textColor = .lightGray
        return lbl
    }()
    
    var movieImageCallback: ( ()->Void )?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        movieImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(movieImageTapped)))
        playIconView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(movieImageTapped)))
        
        self.contentView.addSubview(movieImage)
        movieImage.easy.layout([
            Leading(10), Trailing(10), Top(20), Height(200), Width(UIScreen.main.bounds.width)
        ])
        
        movieImage.addSubview(playIconView)
        playIconView.easy.layout([
            Size(50), Center()
        ])
        
        playIconView.addSubview(playIcon)
        playIcon.easy.layout([
            Center(), Size(35)
        ])
        
        self.contentView.addSubview(movieName)
        movieName.easy.layout([
            Leading(10), Top(10).to(movieImage, .bottom)
        ])
        
        self.contentView.addSubview(movieDesc)
        movieDesc.easy.layout([
            Leading(10), Top(10).to(movieName, .bottom), Trailing(20)
        ])
        
        self.contentView.addSubview(movieYear)
        movieYear.easy.layout([
            Leading(10), Top(10).to(movieDesc, .bottom)
        ])
        
        self.contentView.addSubview(movieYearText)
        movieYearText.easy.layout([
            Leading(4).to(movieYear, .trailing), Top().to(movieYear, .top)
        ])
        
        self.contentView.addSubview(movieSort)
        movieSort.easy.layout([
            Leading(10), Top(7).to(movieYear, .bottom), Bottom(20)
        ])
        
        self.contentView.addSubview(movieSortText)
        movieSortText.easy.layout([
            Leading(4).to(movieSort, .trailing), Top().to(movieSort, .top)
        ])
    }
    
    func configureMovies(data: MoviesModel) {
        movieImage.image = UIImage(named: data.movieImage)
        playIconView.isHidden = data.playIconView
        movieName.text = data.movieName
        movieDesc.text = data.movieDesc
        movieYear.text = data.movieYear
        movieYearText.text = data.movieYearText
        movieSort.text = data.movieSort
        movieSortText.text = data.movieSortText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    @objc func movieImageTapped() {
        movieImageCallback?()
    }

}
