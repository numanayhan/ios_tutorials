//
//  Store.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Store: UICollectionViewController ,UICollectionViewDelegateFlowLayout  {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
       
        setTopBar()
        
    }
    func setTopBar(){
        
        let icon = UIImage.init(named: "icon")!
        let imageLeft = resizeImage(image: icon)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageLeft, style: .plain,  target: self, action: #selector(favPost))

    }
    func resizeImage(image: UIImage ) -> UIImage {
        
        let widthRatio  =  24.0
        let heightRatio = 24.0 
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: 24, height: 24)
        } else {
            newSize = CGSize(width: 24,  height: 24)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    @objc func favPost(){
        print("favPost")
    }
    @objc func savePost(){
        print("favPost")
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 0
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) 
        return cell
    }
}
