//
//  Store.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
private let reuseId  = "StoreCell"

class Store: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    var isDarkStatusBar = true {
      didSet {
        self.setNeedsStatusBarAppearanceUpdate()
      }
    }
    var collectionSizeType:CGSize? = CGSize.init(width: 24, height: 24)
    var isShowcase:Bool? = true
    var isList:Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (isList == true ){
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
            layout.minimumInteritemSpacing = 04
            layout.minimumLineSpacing = 04
            layout.invalidateLayout()
            collectionSizeType =    CGSize(width: ((self.view.frame.width ) - 6), height: 200)
        }else if (isShowcase == true ){
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
            layout.minimumInteritemSpacing = 04
            layout.minimumLineSpacing = 04
            layout.invalidateLayout()
            collectionSizeType =    CGSize(width: ((self.view.frame.width/2) - 6), height: ((self.view.frame.width / 2) - 6))
        }else{
            
        }
        setTopBar()
        setStoreRegister()
         
    }
    func setStoreRegister(){
        collectionView?.backgroundColor =  UIColor.init(named: "bg")
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 15
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    func setTopBar(){
          
        let logoImage = UIImage(named: "logoLeft")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: -10, y: 0, width: 120, height: 44)
        logoImageView.contentMode = .scaleAspectFit
        let logoView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        logoView.clipsToBounds = false
        logoView.addSubview(logoImageView)
        let logoItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoItem
        title = "Vitrin"
        
        UINavigationBar.appearance().tintColor = .white
        
        let rightImage = UIImage(named: "store")
        let rightImageView = UIImageView(image: rightImage)
        rightImageView.frame = CGRect(x: -10, y: 0, width: 120, height: 44)
        rightImageView.contentMode = .scaleAspectFit
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        rightView.clipsToBounds = false
        rightView.addSubview(rightImageView)
        let rightItem = UIBarButtonItem(customView: rightView)
        navigationItem.rightBarButtonItem = rightItem
         
    }
    func resizeImage(image: UIImage,width:Double,height:Double ) -> UIImage {
        let widthRatio  =  width
        let heightRatio = height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: width , height:height )
        } else {
            newSize = CGSize(width: width,  height: height )
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
      return newImage!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionSizeType!
    }
    
}
