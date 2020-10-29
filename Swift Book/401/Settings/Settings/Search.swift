//
//  Search.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Network
import RxSwift
import RxCocoa

struct Categories {
    var id : Int?
    var name:String?
    var total:String?
    var icon:String?
    var description:String?
    init(id : Int,name:String,total:String,icon:String,description:String) {
        self.id = id
        self.name = name
        self.total = total
        self.icon = icon
        self.description = description
    }
}
class CategoriesProtocol {
    var id : String?
    var name:String?
    var total:String?
    var icon:String?
    var description:String?
    init(_ dictionary: [String: Any]) {
        self.id =  dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.total = dictionary["total"] as? String
        self.icon = dictionary["icon"] as? String
        self.description = dictionary["description"] as? String
    }
}
class Search: UIViewController, UISearchBarDelegate  {
    
    var refresher = UIRefreshControl()
    var searchBar = UISearchBar()
    var inSearchMode = false
    var defaultRequest = DefaultRequest()
    var categoriesList  = [CategoriesProtocol]()
    var collectionSizeType:CGSize? = CGSize.init(width: 24, height: 24)
     
    lazy var tableViews: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var categories = [Categories]()
    var shownTitles = [String]()
    let disposeBag = DisposeBag()
    var shownCities = [String]() // Data source for UITableView
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViews.tableHeaderView = searchBar
        
        self.view.addSubview(tableViews)
        NSLayoutConstraint.activate([
            tableViews.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableViews.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        view.backgroundColor = .white
        
        setSearchBar()
        setLeftItems()
        setCategoriesData()
         
         
    }
//    func setTableView() {
//        tableViews.delegate = self
//        tableViews.dataSource = self
//        tableViews.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
//        refresher.attributedTitle = NSAttributedString(string:"Yenileniyor",
//        attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "header")!])
//        refresher.addTarget(self, action: #selector(setCategoriesData), for: .valueChanged)
//        tableViews.refreshControl = refreshControl
//        tableViews.allowsMultipleSelection = false
//    }
    @objc func setCategoriesData(){
        if (UserDefaults.standard.string(forKey: "userHash") != nil){
            let  userHash = UserDefaults.standard.string(forKey: "userHash")!
            let parameters  = [  "route" : "advert/category/sub_categories" ,"userHash":userHash ]
            if Network.isConnectedToNetwork() == true {
                defaultRequest.getParamsRequest(url: Config.isInit, parameters: parameters) { data in
                    DispatchQueue.main.async {
                        let dataStatus:NSDictionary = data  as NSDictionary.Value as! NSDictionary
                        if (dataStatus.object(forKey:"categories") != nil){
                            let categories : NSArray = dataStatus.object(forKey: "categories") as! NSArray
                            self.categoriesList = categories.compactMap{return CategoriesProtocol(($0 as? [String : AnyObject])!)}
                            self.tableViews.reloadData()
                        }else{
                            self.setNotify(text: "Sunucu ile bağlantınız kontrol ediniz")
                        }
                    }
                }
            }else{
                self.setNotify(text: "İnternet bağlantınız kontrol ediniz")
            }
        }
        refresher.endRefreshing()
    }
    func setNotify(text:String){
        let alert = UIAlertController(title: "Satış Garanti", message: text, preferredStyle: .alert)
        alert.modalPresentationStyle = .overCurrentContext
        self.present(alert, animated: true) 
        let duration: Double = 1.2
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
   
    func setLeftItems(){
        
        let logoImage = UIImage(named: "logoLeft")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: -10, y: -5, width: 120, height: 44)
        logoImageView.contentMode = .scaleAspectFit
        let logoView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        logoView.clipsToBounds = false
        logoView.addSubview(logoImageView)
        let logoItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoItem
        
    }
    func setSearchBar(){
        let searchTextField: UITextField
        searchTextField = (searchBar.value(forKey: "searchField") as? UITextField) ?? UITextField()
        if let systemPlaceholderLabel = searchTextField.value(forKey: "placeholderLabel") as? UILabel {
            let placeholderLabel = UILabel(frame: .zero)
            placeholderLabel.text = "Kelime veya İlan No ile Ara"
            placeholderLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
            placeholderLabel.textColor = UIColor.blue.withAlphaComponent(0.5)
            systemPlaceholderLabel.addSubview(placeholderLabel)
            placeholderLabel.leadingAnchor.constraint(equalTo: systemPlaceholderLabel.leadingAnchor).isActive = true
            placeholderLabel.topAnchor.constraint(equalTo: systemPlaceholderLabel.topAnchor).isActive = true
            placeholderLabel.bottomAnchor.constraint(equalTo: systemPlaceholderLabel.bottomAnchor).isActive = true
            placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
            placeholderLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            searchBar.placeholder = placeholderLabel.text

        } else {
            searchBar.placeholder = "Kelime veya İlan No ile Ara"
        }
        searchBar.backgroundColor = UIColor.white
        searchBar.backgroundImage = UIImage()
        searchTextField.backgroundColor = UIColor.init(named: "search")
        tableViews.tableHeaderView = searchBar
    }
    
}
extension Search : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as! SearchTableViewCell
            cell.titleLabel.text = shownCities[indexPath.row]
            return cell
        }
}
class SearchTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var iconThumb: UIImageView = {
       let icon = UIImageView()
        
        return icon
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        setupUI()
    }
    
    private func setupUI() {
        
    
     self.contentView.addSubview(iconThumb)
        iconThumb.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
     self.contentView.addSubview(titleLabel)
        iconThumb.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
   }
}
 
