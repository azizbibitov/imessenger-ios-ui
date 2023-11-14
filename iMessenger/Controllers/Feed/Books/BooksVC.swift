//
//  BooksVC.swift
//  iMessenger
//
//  Created by Nowruz Garryyew on 20.08.2022.
//

import UIKit

class BooksVC: UIViewController {
    
    var booksData = [
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
        BooksModel(bookImage: "book", bookName: "Portrait Doriana Gray", bookDesc: "Karoce bet kitap okan okamasanyzam satyn alyn dashy owadanja kitap oynuzde goysanyz gorenler sizi umny adam hasaplar tipo bet gorunersiniz umumy dushundiniza shu tekst bilen name gorkeziljek bolyanmymy"),
    ]
    
    var mainView: BooksView {
        return view as! BooksView
    }
    
    override func loadView() {
        super.loadView()
        
        view = BooksView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorBackground")
        
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

extension BooksVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "booksTableViewCell", for: indexPath) as! BooksTableViewCell
        cell.configureBook(data: booksData[indexPath.row])
//        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "colorWhiteBlackCell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = BookPreviewVC()
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
