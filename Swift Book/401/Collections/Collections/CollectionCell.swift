//
//  CollectionCell.swift
//  Collections
//
//  Created by Numan Ayhan on 3.09.2021.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    var view : UIView  = {
        let view = UIView()
        return view
    }()
    var color:String?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var nibName: String {
        return String(describing: type(of: self))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
    func setLayout(){
        
        contentView.addSubview(view)
        view.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: frame.height)
        
    }
}
