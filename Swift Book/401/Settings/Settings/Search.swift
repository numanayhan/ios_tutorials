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
private let reuseIdentifier = "Categories"
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
class Search: UITableViewController, UISearchBarDelegate  {
    
    var refresher = UIRefreshControl()
    var searchBar = UISearchBar()
    var inSearchMode = false
    var collectionView: UICollectionView!
    var collectionViewEnabled = true
    var defaultRequest = DefaultRequest()
    var categoriesList  = [CategoriesProtocol]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setTopBar()
        setTableView()
        setCategoriesData()
        
    }
    func setTableView() {
         
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: reuseIdentifier)
        refresher.attributedTitle = NSAttributedString(string:"Yenileniyor",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(named: "header")!])
        refresher.addTarget(self, action: #selector(refreshResult), for: .valueChanged)
        tableView.refreshControl = refreshControl
        tableView.allowsMultipleSelection = false
    }
    @objc func refreshResult(){
        print("refreshResult")
        tableView.reloadData()
        refresher.endRefreshing()
        
    }
    func setCategoriesData(){
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
                            self.tableView.reloadData()
                        }else{
                            //server error
                        }
                    }
                }
            }else{
                //network error
                print("network not available")
                setNotify(text: "İnternet bağlantınız kontrol ediniz")
            }
        }
       
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SearchSection.allCases.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SearchSection(rawValue: section) else {return 0}
        switch  section {
        case .categories:
            return categoriesList.count
        case .emergency:
            return 1
        case .interested:
            return 1
        case .near:
            return 1
        case .lastSearch:
            return 1
        case .lastVisit:
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewHeader = UIView()
        viewHeader.layer.borderWidth = 0.5
        viewHeader.backgroundColor = .white
        viewHeader.layer.borderColor = UIColor.init(white: 1.0, alpha: 1.0).cgColor
       
        if section == 0 {
            viewHeader.frame = CGRect.init(x: 0, y: 0, width: viewHeader.frame.width, height: 50)
            viewHeader.addSubview(searchBar)
            searchBar.anchor(top: viewHeader.topAnchor, left: viewHeader.leftAnchor   , bottom: nil, right: viewHeader.rightAnchor, paddingTop: 5, paddingLeft:5, paddingBottom: 0, paddingRight:5, width: viewHeader.frame.width, height:  60)
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
            
        }
        
      return viewHeader
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("editing")
        searchBar.text?.removeAll()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tableView.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
          return 80
        }
        return 30
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:  reuseIdentifier, for: indexPath) as? CategoriesCell {
                
           if (categoriesList.count   > 0) {
            cell.titleText.text = categoriesList[indexPath.row].name
            cell.accessoryType = .disclosureIndicator
            return cell
           }
        }
      return UITableViewCell()
    }
    func setTopBar(){
        
        setLeftItems()
        setSearchBar()
        
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
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
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
}
class  CategoriesCell: UITableViewCell {
    
    lazy var categoryView : UIView = {
       let view  = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    lazy var titleText : UILabel = {
        let titleText  =  UILabel()
        titleText.textColor = UIColor.black
        titleText.textAlignment = .left
        return titleText
    }()
    lazy var iconView: UIImageView = {
       let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.translatesAutoresizingMaskIntoConstraints = true
        icon.image = UIImage.init(named: "un_store")
        return icon
    }()
    var id : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.addSubview(titleText)
        titleText.anchor(top: categoryView.topAnchor, left: categoryView.leftAnchor, bottom: nil, right: categoryView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: categoryView.frame.width , height: categoryView.frame.height)
        
        addSubview(categoryView)
        categoryView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if  isHighlighted{
            contentView.backgroundColor   =  UIColor.init(named: "bar")
        }
    }
}
