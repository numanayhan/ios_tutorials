//
//  ViewController.swift
//  Core Graphics
//
//  Created by Melike Büşra Ayhan on 8.09.2020.
//  Copyright © 2020 com.lyrebird. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage.init(named: "kapadokya")
        // Do any additional setup after loading the view.
    }
    @IBAction func saveDraw(_ sender: UIButton) {
        
        let renderer = UIGraphicsImageRenderer(size: CGSize.init(width: 200, height: 200))
        let image = renderer.image { (ctx) in
            let rectange  = CGRect(x: 0, y: 0, width: 200, height: 200)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.addRect(rectange)
            ctx.cgContext.drawPath(using: .fillStroke)
            let bg = UIImage.init(named: "kapadokya")!
            bg.draw(at: CGPoint.init(x: 200, y: 200))
            
            let tour = UIImage.init(named: "fx1")! 
            tour.draw(at: CGPoint.init(x: 50, y: 50))
            
        }
        imageView.image = image
        guard let selectedImage = imageView.image else {
                print("Image not found!")
                return
            }
            UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
         
    
    }
    //MARK: - Add image to Library
       @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
           if let error = error {
               // we got back an error!
               showAlertWith(title: "Save error", message: error.localizedDescription)
           } else {
               showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
           }
       }

       func showAlertWith(title: String, message: String){
           let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "OK", style: .default))
           present(ac, animated: true)
       }

}

