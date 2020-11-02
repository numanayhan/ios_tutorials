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
    let headerColor = UIColor.init(named: "headerBar")
    var tableViews: UITableView = {
       let tableView = UITableView()
        
        return tableView
    }()
    let searchBarView = UIView()
    var isSearch:Bool = false
    var categories = [Categories]()
    var shownTitles = [String]()
    let disposeBag = DisposeBag()
    var shownCities = [String]() // Data source for UITableView
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setSearch()
       
    }
    func setSearch(){
        view.backgroundColor = .white
        
        setLeftItems()
        setTableView()
        setCategoriesData()
    }
    @objc func setCategoriesData(){
        if (UserDefaults.standard.string(forKey: "userHash") != nil){
            let  userHash = UserDefaults.standard.string(forKey: "userHash")!
            let parameters  = [  "route" : "advert/category/sub_categories" ,"userHash":userHash ]
            if Network.isConnectedToNetwork() == true {
                defaultRequest.getParamsRequest(url: Config.isInit, parameters: parameters) { data in
                    DispatchQueue.main.async {
                        print("search",data)
                        let dataStatus:NSDictionary = data  as NSDictionary.Value as! NSDictionary
                        if (dataStatus.object(forKey:"categories") != nil){
                            let categories : NSArray = dataStatus.object(forKey: "categories") as! NSArray
                            self.categoriesList = categories.compactMap{return CategoriesProtocol(($0 as? [String : AnyObject])!)}
                             
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
    func setSearchHeaderBar(){
        
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
        
        searchBarView.backgroundColor = .lightGray
        tableViews.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height  )
        tableViews.tableHeaderView?.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: 50  )
        tableViews.tableHeaderView = searchBarView
        tableViews.sectionHeaderHeight = searchBarView.frame.height
        
    }
     
    func setTableView() {
        
        tableViews = UITableView(frame: .infinite, style: .grouped)
        tableViews.backgroundColor = UIColor.white
        tableViews.delegate = self
        tableViews.dataSource = self
        tableViews.register(SettingCell.self, forCellReuseIdentifier: "SearchCell")
        view.addSubview(tableViews)
        tableViews.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: view.frame.height)
        //HEADER AND SEARCH
        setSearchHeaderBar()
        
        //tableViews.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 120))
        
        
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("editing")
        isSearch = true
        searchBar.text?.removeAll()
        return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       print("clear list")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       print("search")
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tableViews.endEditing(true)
    }
    
    
}
extension Search : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SearchSection.allCases.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return " "
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = SearchSection(rawValue: section) else {return 0}
        switch  section {
        case .search:
            return 50
        case .categories:
            return 0
        case .emergency:
            return 0
        case .interested:
            return 0
        case .near:
            return 0
        case .lastSearch:
            return 0
        case .lastVisit:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SearchSection(rawValue: section) else {return 0}
        switch  section {
        case .search:
            return Searching.allCases.count
        case .categories:
            return 0//categoriesList.count
        case .emergency:
            return 0//EmergencySection.allCases.count
        case .interested:
            return 0
        case .near:
            return 0
        case .lastSearch:
            return 0
        case .lastVisit:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.layer.borderWidth = 0.5
        viewHeader.backgroundColor = headerColor
        viewHeader.layer.borderColor = UIColor.init(white: 0.7, alpha: 1.0).cgColor
        
        if section == 0 {
            
            viewHeader.addSubview(searchBar)
            searchBar.anchor(top: viewHeader.topAnchor, left: viewHeader.leftAnchor   , bottom: viewHeader.bottomAnchor, right: viewHeader.rightAnchor, paddingTop: 0, paddingLeft:0, paddingBottom: 0, paddingRight:0, width: viewHeader.frame.width, height:  searchBar.frame.height)
            
        }else if section != 0 {
            
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize:16)
            title.text = SearchSection(rawValue: section)?.description
            title.text = title.text!.uppercased()
            title.textColor = UIColor.init(named: "header")
            viewHeader.addSubview(title)
            title.translatesAutoresizingMaskIntoConstraints  = false
            title.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor,constant: -4).isActive = true
            title.leftAnchor.constraint(equalTo: viewHeader.leftAnchor,constant: 16).isActive = true
        }
        searchBar.delegate  = self
        
       
        /*let viewHeader = UIView()
        viewHeader.layer.borderWidth = 0.5
        viewHeader.backgroundColor = .white
        viewHeader.layer.borderColor = UIColor.init(white: 1.0, alpha: 1.0).cgColor
         
        if section == 0 {
            viewHeader.frame = CGRect.init(x: 0, y: 0, width: viewHeader.frame.width, height: 50)
            viewHeader.addSubview(searchBar)
            searchBar.anchor(top: viewHeader.topAnchor, left: viewHeader.leftAnchor   , bottom: nil, right: viewHeader.rightAnchor, paddingTop: 5, paddingLeft:5, paddingBottom: 0, paddingRight:5, width: viewHeader.frame.width, height:  50)
            searchBar.delegate = self
        }else{
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize:16)
            title.text = SearchSection(rawValue: section)?.description
            title.text = title.text!.uppercased()
            title.textColor = UIColor.init(named: "header")
            viewHeader.addSubview(title)
            title.translatesAutoresizingMaskIntoConstraints  = false
            title.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor,constant: -4).isActive = true
            title.leftAnchor.constraint(equalTo: viewHeader.leftAnchor,constant: 16).isActive = true
            
        }*/
        
      return viewHeader

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //let cell = tableViews.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
            //cell.titleLabel.text = shownCities[indexPath.row].description
        return UITableViewCell()
    }
    
}

class SearchCell: UITableViewCell {
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
 
