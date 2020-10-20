//
//  SecondSegment.swift
//  Settings
//
//  Created by nayhan on 20.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation

import UIKit
@IBDesignable
class SecondSegment: UIControl {
    var buttons = [UIButton]()
    var selectedSegmentIndex = 0
    var stackView = UIStackView()
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 5 {
        
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var commaSeperatedButtonTitles: String = "" {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var textColor: UIColor = UIColor.darkGray {
        
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var selectorColor: UIColor = UIColor.init(red: 18, green: 21, blue: 31, alpha: 1.0) {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor = UIColor.init(red: 151, green: 173, blue: 207, alpha: 1.0) {
        
        didSet {
            updateView()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    func updateView() {
        
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton.init(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            button.setTitleColor(button.isSelected ? UIColor.gray : selectorTextColor, for: .normal)
             
            buttons.append(button)
        }
        buttons[0].titleLabel?.textColor = textColor
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        buttons[0].backgroundColor    = UIColor.white
        
        stackView = UIStackView.init(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
  }
    override func draw(_ rect: CGRect) {
 
    }
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex,btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                selectedSegmentIndex = buttonIndex
                UIView.animate(withDuration: 0.3, animations: {
                  
                  if self.selectedSegmentIndex == 0 {
                       self.buttons[0].roundCorners(corners: [.topLeft,.bottomLeft], radius: 5)
                       self.buttons[0].backgroundColor    = UIColor.white
                       self.buttons[1].backgroundColor    = UIColor.lightGray
                     }else  if self.selectedSegmentIndex == 1 {
                       self.buttons[1].roundCorners(corners: [.topRight,.bottomRight], radius: 5)
                       self.buttons[0].backgroundColor    = UIColor.lightGray
                       self.buttons[1].backgroundColor    = UIColor.white
                    }
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
            } else {
                self.buttons[self.selectedSegmentIndex].backgroundColor = .white
            }
            
        }
        sendActions(for: .valueChanged)
    }
    func updateSegmentedControlSegs(index: Int) {
        for btn in buttons {
            btn.setTitleColor(textColor, for: .normal)
        }
        
        buttons[index].setTitleColor(selectorTextColor, for: .normal)
        
    }
}
