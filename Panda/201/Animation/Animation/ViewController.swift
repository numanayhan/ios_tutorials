//
//  ViewController.swift
//  Animation
//
//  Created by TRA on 23.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
import Loady
import Lottie
class ViewController: UIViewController {
   @IBOutlet weak var loadingBar: AnimationView!
    @IBOutlet var uberLikeView : LoadyButton!
    
    var fourPhaseTempTimer : Timer?
    var fourPhases : LoadyFourPhaseButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI(){
        self.uberLikeView.setAnimation(LoadyAnimationType.topLine())
        
        navigationItem.hidesBackButton = true
        let animation = Animation.named("loading_bar")
        loadingBar.frame.origin = CGPoint(x: 0, y: 58)
        loadingBar.frame.size = CGSize(width: view.frame.width  , height: 5)
        loadingBar.contentMode = .center
        loadingBar.clipsToBounds = true
        loadingBar.backgroundColor = .white
        loadingBar.animation = animation
        loadingBar.loopMode = .loop
        loadingBar.sizeToFit()
        
        loadingBar.play()
        
        self.uberLikeView.addTarget(self, action:#selector(animateView(_:)), for:.touchUpInside)
    }

    @objc func animateView(_ sender : UIButton){
        loadingBar.stop()
        guard let button = sender as? LoadyButton else {
            return
        }
        if button.loadingIsShowing() {
            button.stopLoading()
            return
        }
        
        button.startLoading()
        button.backgroundFillColor = .black
        button.backgroundColor = .black
    }
    @objc func loadLine(){
        
         
            
    }
}

