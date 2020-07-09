//
//  PersonCell.swift
//  TableView
//
//  Created by TRA on 20.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
       static var nib:UINib {
           return UINib(nibName: identifier, bundle: nil)
       }
       static var identifier: String {
           return String(describing: self)
       }
       override func layoutSubviews() {
           contentView.backgroundColor = UIColor.white
           backgroundColor = UIColor.white
           
       }
}
