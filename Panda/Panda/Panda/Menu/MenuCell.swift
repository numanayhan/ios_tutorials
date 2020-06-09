//
//  MenuCell.swift
//  Panda
//
//  Created by TRA on 17.02.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

   
    @IBOutlet weak var titleMenu: UILabel!
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var selectedView: UILabel!
      
    override func awakeFromNib() {
         super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      if isSelected {
        contentView.backgroundColor =  UIColor.init(red: 229/255, green: 233/255, blue: 236/255, alpha: 1.0)
        imageMenu.tintColor = UIColor.black
        titleMenu.textColor = UIColor.black
        selectedView.isHidden = false
      }
      else if  isHighlighted{
        contentView.backgroundColor   =  UIColor.init(red: 229/255, green: 233/255, blue: 236/255, alpha: 1.0)
        titleMenu.textColor = UIColor.black
        imageMenu.tintColor = UIColor.black
        selectedView.isHidden = true
      }
      else {
        contentView.backgroundColor =  UIColor.init(white: 1.0, alpha: 1.0)
        titleMenu.textColor = UIColor.black
        imageMenu.tintColor = UIColor.lightGray
        selectedView.isHidden = true
      }
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
}
