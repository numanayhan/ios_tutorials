//
//  Extentions.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
import UIKit
 

let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
extension CALayer {

    func addRadius(_ corners: UIRectCorner, radius: CGFloat, view: UIView) {
        let mask = CAShapeLayer()
        mask.bounds = view.frame
        mask.position = view.center
        mask.backgroundColor = UIColor.white.cgColor
        mask.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        view.clipsToBounds = false
        view.layer.mask = mask
         
    }
    func addRadius(radius: CGFloat) {
        self.cornerRadius = radius
        self.borderWidth = 1
        self.borderColor = UIColor.init(named: "border")?.cgColor
        self.backgroundColor = UIColor.white.cgColor
        self.bounds.inset(by: padding) 
    }
}
extension   UITextField{
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    enum direction {
        case left
        case right
    }
    func withImage(direction: direction, image: UIImage){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        view.backgroundColor = .white
        view.clipsToBounds = true
        mainView.addSubview(view)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 8.0, y: 12.0, width: 20.0, height: 20.0)
        view.addSubview(imageView)
        if(UITextField.direction.left == direction){
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            self.rightViewMode = .always
            self.rightView = mainView
        }
    }
}
extension String {  
    public static func localize(_ key: String ) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
class CustomTF: UITextField {
    
    let insets : UIEdgeInsets
    init(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)) {
        self.insets = insets
        super.init(frame: .zero)
        layer.cornerRadius = 2
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.init(named: "border")?.cgColor
    }
    required init?(coder aDecoder: NSCoder) {
       fatalError("Error")
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: insets)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
} 
extension UIView {
     
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
}
extension UIButton
{
  func roundCorners(corners:UIRectCorner, radius: CGFloat) {
      let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
      let mask = CAShapeLayer()
      mask.path = path.cgPath
      self.layer.mask = mask

  }  
   func loading(_ show: Bool) {
        if show {
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.color = UIColor.init(named: "loading")
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            for view in self.subviews {
                if let indicator = view as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                }
            }
        }
    }
}
