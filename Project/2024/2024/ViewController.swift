//
//  ViewController.swift
//  2024
//
//  Created by TRA on 9.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var n11: UIView!
    @IBOutlet weak var n12: UIView!
    @IBOutlet weak var n13: UIView!
     @IBOutlet weak var gameView: UIView!
    var numberOrigin:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: n11)
        numberOrigin = n11.frame.origin
        view.bringSubviewToFront(n11)
        
    }
    func addPanGesture(view:UIView){
        let pan  = UIPanGestureRecognizer(target: self, action: #selector(handle(sender:)))
        view.addGestureRecognizer(pan)
    }
    @objc func handle(sender:UIPanGestureRecognizer){
        print(sender.maximumNumberOfTouches)
        print(sender.minimumNumberOfTouches)
        let oneRow = sender.view!
        switch sender.state {
        case .began,.changed:
            movePan(view: oneRow, sender: sender)
        case .ended:
             deleteView(view: oneRow)
        default:
            break
        }
    }
    func movePan(view:UIView, sender:UIPanGestureRecognizer){
        let translation = sender.translation(in: view)
        view.center = CGPoint(x:  view.center.x + translation.x, y:  view.center.y   + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    func deleteView(view:UIView){
        UIView.animate(withDuration: 0.3) {
            view.alpha = 0.0
        }
    }
}

