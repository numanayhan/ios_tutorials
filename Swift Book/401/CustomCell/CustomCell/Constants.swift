//
//  Constants.swift
//  CustomCell
//
//  Created by nayhan on 14.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
import UIKit
struct Images {
    static let one = UIImage.init(named: "one")
    static let two = UIImage.init(named: "two")
}
struct Video{
    var image:UIImage
    var title:String
}
class VideoCell: UITableViewCell{
    var imageViews  = UIImageView()
    var titleTexts = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageViews)
        addSubview(titleTexts)
        setImageView()
        setLabel()
        setImageConstraint()
        setTitleConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
    func set(image:Video){
        imageViews.image  = image.image
        titleTexts.text = image.title
        
    }
    func setImageView(){
        imageViews.layer.cornerRadius = 10
        imageViews.clipsToBounds = true
    }
    func setLabel(){
        titleTexts.numberOfLines  = 0
        titleTexts.adjustsFontSizeToFitWidth = true
    }
    func setImageConstraint(){
        imageViews.translatesAutoresizingMaskIntoConstraints  = false
        imageViews.centerYAnchor.constraint(equalTo: centerYAnchor).isActive  = true
        imageViews.leadingAnchor.constraint(equalTo: leadingAnchor).isActive  = true
        imageViews.heightAnchor.constraint(equalTo: imageViews.heightAnchor).isActive  = true
        imageViews.widthAnchor.constraint(equalTo: imageViews.widthAnchor).isActive  = true
    }
    func setTitleConstraint(){
        titleTexts.translatesAutoresizingMaskIntoConstraints = false
        titleTexts.centerYAnchor.constraint(equalTo: centerYAnchor).isActive  = true
        titleTexts.leadingAnchor.constraint(equalTo: imageViews.trailingAnchor,constant: 20).isActive  = true
        titleTexts.heightAnchor.constraint(equalToConstant: 80).isActive  = true
        titleTexts.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12).isActive = true
        
    }
}
