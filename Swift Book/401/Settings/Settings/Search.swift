//
//  Search.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Categories"
private let reuseId = "SearchCollectionCell"
class Categories {
    var id : String?
    var title:String?
    var category_id:String?
    init(_ dictionary: [String: Any]) {
        self.id =  dictionary["parent_id"] as? String
        self.title = dictionary["name"] as? String
        self.category_id = dictionary["category_id"] as? String
    }
}
class CategoriesPostCell: UICollectionViewCell {
    let catsTitle: UILabel = {
        let iv = UILabel()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.textAlignment = .left
        return iv
    }()
    var cats: Categories? {
        
        didSet {
            guard let title = cats?.title else { return }
            catsTitle.text = title
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(catsTitle)
        catsTitle.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class CategoriesCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class Search: UITableViewController , UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
     
   
    var searchBar = UISearchBar()
    var inSearchMode = false
    var collectionView: UICollectionView!
    var collectionViewEnabled = true
    var categories = [Categories]()
    var currentKey: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .none
        // self.clearsSelectionOnViewWillAppear = false
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setCollectionView()
        view.backgroundColor = .lightGray
    }
  
     func setCollectionView() {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         let frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - (tabBarController?.tabBar.frame.height)! - (navigationController?.navigationBar.frame.height)!)
         collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
         collectionView.delegate = self
         collectionView.dataSource = self
         collectionView.alwaysBounceVertical = true
         collectionView.backgroundColor = .white
         collectionView.register(CategoriesPostCell.self, forCellWithReuseIdentifier: reuseId)
         configureRefreshControl()
         
         tableView.addSubview(collectionView)
         tableView.separatorColor = .clear
    }
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    @objc func handleRefresh() {
           categories.removeAll(keepingCapacity: false)
           self.currentKey = nil
           collectionView?.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Categories", for: indexPath) as! CategoriesPostCell
        cell.catsTitle.text = categories[indexPath.item].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoriesType = CategoriesType()
        categoriesType.catsId = categories[indexPath.row].category_id
        navigationController?.pushViewController(categoriesType, animated: true)
        
    }
}
