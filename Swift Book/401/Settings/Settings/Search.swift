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

class Search: UITableViewController {
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
