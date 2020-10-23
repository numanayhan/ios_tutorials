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
    var isShowcase:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowcase = true
        
        setTopBar()
        setStoreRegister()
        setCollectionStyle(true)
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
        logoImageView.frame = CGRect(x: -10, y: -5, width: 120, height: 44)
        logoImageView.contentMode = .scaleAspectFit
        let logoView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        logoView.clipsToBounds = false
        logoView.addSubview(logoImageView)
        let logoItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoItem
        
        let button =  UIButton(type: .custom)
        let store = resizeImage(image: UIImage.init(named: "un_store")!,width: 24,height: 24)
        button.setImage(store, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(changeList), for: .touchUpInside)
        let rightItem = UIBarButtonItem(customView: button)

        navigationItem.rightBarButtonItem = rightItem
         
    }
    @objc func changeList(sender:UIButton){
        if sender.isTouchInside {
            setCollectionStyle(sender.isTouchInside)
        }
    }
    func setCollectionStyle(_ isShow:Bool){
        
        if isShowcase == true {
            self.isShowcase = false
            setTable()
        }else if isShowcase == false  {
            self.isShowcase = true
            setCollection()
        }
    }
    func setCollection(){
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout.minimumInteritemSpacing = 04
        layout.minimumLineSpacing = 04
        layout.invalidateLayout()
        collectionSizeType =    CGSize(width: ((self.view.frame.width ) - 6), height: 200)
        collectionView.reloadData()
    }
    func setTable(){
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4)
        layout.minimumInteritemSpacing = 04
        layout.minimumLineSpacing = 04
        layout.invalidateLayout()
        collectionSizeType =    CGSize(width: ((self.view.frame.width/2) - 6), height: ((self.view.frame.width / 2) - 6))
        collectionView.reloadData()
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
