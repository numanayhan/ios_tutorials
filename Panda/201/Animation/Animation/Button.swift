//
//  Button.swift
//  Animation
//
//  Created by TRA on 23.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import Foundation
import UIKit
import Loady
class LoadButton: UIButton {
    
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    
    func showLoading() {
        originalButtonText = self.titleLabel?.text
        self.setTitle("", for:  .normal)
        
        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }
        showSpinning()
    }
    
    func hideLoading() {
        self.setTitle(originalButtonText, for:  .normal)
        activityIndicator.stopAnimating()
    }
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.white
        return activityIndicator
    }
    
    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }
    
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    func loading(_ isLoading: Bool) {
        isEnabled = !isLoading
        
        if isLoading {
            originalButtonText = titleLabel?.text
            setTitle("", for: .normal)
            activityIndicator.startAnimating()
            
        } else {
            setTitle(originalButtonText, for: .normal)
            activityIndicator.stopAnimating()
        }
    }
}
class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
    
}
extension UIButton{
    
    func nextButton(buttonTilte: String) {
        let button = self
        //        button.frame = CGRect(x: buttonPositionX, y: buttonPositionY, width: buttonWidth, height: buttonHeight)
        button.titleLabel!.font =  UIFont(name: "Montserrat", size: 20)
        let image = UIImage(named:"next")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 10)
        button.setImage(imageView.image, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
        button.titleEdgeInsets =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView.frame.width))
        
    }
    
}
