//
//  AppearanceVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 30.08.2022.
//

import UIKit

class AppearanceVC: UIViewController, ControllerTitle {

    static var title: String { return "Appearance" }
    static var image: String { return "appearance" }
    
    var colorDataImage = [
        UserInterfaceColorModel(userInterfaceColor: "userColor1", userInterfaceColorId: 0),
        UserInterfaceColorModel(userInterfaceColor: "userColor2", userInterfaceColorId: 1),
        UserInterfaceColorModel(userInterfaceColor: "userColor3", userInterfaceColorId: 2),
        UserInterfaceColorModel(userInterfaceColor: "userColor4", userInterfaceColorId: 3),
        UserInterfaceColorModel(userInterfaceColor: "userColor5", userInterfaceColorId: 4),
        UserInterfaceColorModel(userInterfaceColor: "userColor6", userInterfaceColorId: 5),
        UserInterfaceColorModel(userInterfaceColor: "userColor7", userInterfaceColorId: 6),
        UserInterfaceColorModel(userInterfaceColor: "userColor8", userInterfaceColorId: 7),
        UserInterfaceColorModel(userInterfaceColor: "userColor9", userInterfaceColorId: 8),
        UserInterfaceColorModel(userInterfaceColor: "userColor10", userInterfaceColorId: 9),
    ]
    
    var mainView: AppearanceView {
        return view as! AppearanceView
    }
    
    override func loadView() {
        super.loadView()
        
        view = AppearanceView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = UIColor(named: "colorBackground")
        navigationItem.title = "Appearance"
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.darkModeSwitch.addTarget(self, action: #selector(switchDarkMode), for: .valueChanged)
        
        ThemeUserDefaults.shared.theme = (mainView.darkModeSwitch.isOn ? Theme(rawValue: 1)  : Theme(rawValue: 0))!
//        mainView.darkModeSwitch.isOn = (ThemeUserDefaults.shared.theme.rawValue != 0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        
        tabBarController?.tabBar.tintColor = ColorUserDefaults.shared.color.getColorInterface()
        tabBarController?.tabBar.unselectedItemTintColor = UIColor(named: "colorDarkGray")
    }
    
    @objc func switchDarkMode() {
        ThemeUserDefaults.shared.theme = (mainView.darkModeSwitch.isOn ? Theme(rawValue: 1)  : Theme(rawValue: 0))!
    }
}


extension AppearanceVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorDataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "appearanceCollectionViewCell", for: indexPath) as? AppearanceCollectionViewCell else {
        return UICollectionViewCell() }
        
        let id = ColorUserDefaults.shared.color.rawValue
        
        if indexPath.row == id {
            cell.userColorImage.isHidden = false
        }
        
        cell.configureUserInterfaceColor(data: colorDataImage[indexPath.row])
        return cell
    }
}

extension AppearanceVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        ColorUserDefaults.shared.color = Color(rawValue: colorDataImage[indexPath.row].userInterfaceColorId)!

        let cell = collectionView.cellForItem(at: indexPath) as? AppearanceCollectionViewCell

        cell?.userColorImage.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as? AppearanceCollectionViewCell
        cell?.userColorImage.isHidden = true

    }
    
    
    
}

extension AppearanceVC: UICollectionViewDelegateFlowLayout {
    
}


struct ColorUserDefaults {
    
    static var shared = ColorUserDefaults()
    
    var color: Color {
        get {
            Color(rawValue: UserDefaults.standard.integer(forKey: "selectedColor")) ?? .userColor1
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedColor")
        }
    }
}

enum Color: Int {
    
    case userColor1
    case userColor2
    case userColor3
    case userColor4
    case userColor5
    case userColor6
    case userColor7
    case userColor8
    case userColor9
    case userColor10
    
    func getColorInterface() -> UIColor {
        switch self {
        case .userColor1:
            return UIColor(named: "userColor1")!
        case .userColor2:
            return UIColor(named: "userColor2")!
        case .userColor3:
            return UIColor(named: "userColor3")!
        case .userColor4:
            return UIColor(named: "userColor4")!
        case .userColor5:
            return UIColor(named: "userColor5")!
        case .userColor6:
            return UIColor(named: "userColor6")!
        case .userColor7:
            return UIColor(named: "userColor7")!
        case .userColor8:
            return UIColor(named: "userColor8")!
        case .userColor9:
            return UIColor(named: "userColor9")!
        case .userColor10:
            return UIColor(named: "userColor10")!
        }
    }
}


struct ThemeUserDefaults {
    
    static var shared = ThemeUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .light
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}

enum Theme: Int {
    case light
    case dark
    
    @available(iOS 12.0, *)
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
