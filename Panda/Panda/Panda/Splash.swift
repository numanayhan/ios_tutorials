//
//  Splash.swift
//  Panda
//
//  Created by TRA on 23.01.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import QuartzCore
class Splash: UIViewController {

    var mask : CALayer?
    var logo: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logo = UIImageView()
        logo = UIImageView(frame: CGRect(x: (self.view.bounds.width / 2) - 50, y: (self.view.bounds.height / 2) - 50, width: 100, height: 100))
        logo?.contentMode = .scaleAspectFit
        logo!.image = UIImage(named: "app_logo_light")
        self.view.addSubview(logo!)
        self.view.backgroundColor = UIColor(red: 85 / 255.0, green: 172 / 255.0, blue: 238 / 255.0, alpha: 1)
        animate()
        
    }
    func animate() {
            
            let duration = 1.0
            let delay = 1.5
            
            UIView.animateKeyframes(withDuration: duration, delay: delay, options: [], animations: {
                
                    //1st step
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.33, animations: {
                        
                        self.logo!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 90, height: 90)
                    })
                    //2nd step
                    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.33, animations: {
                        self.logo!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 1500, height: 1500)
                    })
                    //3rd step
                    UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.33, animations: {
                        self.logo!.bounds = CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.height / 2, width: 3000, height: 3000)
                    })
                }, completion: { (finished) in
                    self.goToLoginView()
            })
            
        }
        func goToLoginView() {
            self.performSegue(withIdentifier: "goToLogin", sender: self)
        }
        
}
extension Splash :  CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
           
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.logo?.layer.mask = nil
    }
}
