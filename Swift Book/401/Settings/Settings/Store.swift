//
//  Store.swift
//  Settings
//
//  Created by nayhan on 13.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Network
private let reuseId  = "StoreCell"
//struct StoreProtocol
struct StoreProtocol{
    
    let id: String?
    let name: String?
    let thumb: String?
    init(_ dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String
        self.thumb = dictionary["thumb"] as? String
    }
    
}
class Store: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    var isDarkStatusBar = true {
      didSet {
        self.setNeedsStatusBarAppearanceUpdate()
      }
    }
    var collectionSizeType:CGSize? = CGSize.init(width: 24, height: 24)
    var isShowcase:Bool?
    var storeList  = [StoreProtocol]()
    var defaultRequest = DefaultRequest()
    
    let activityView = UIActivityIndicatorView(style: .gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isShowcase = true
        
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        setTopBar()
        setData()
        setStoreRegister()
        setCollectionStyle(true)
    }
    func setData(){
        
        if (UserDefaults.standard.string(forKey: "userHash") != nil){
            let  userHash = UserDefaults.standard.string(forKey: "userHash")
            let parameters  = [  "route" : "common/home" , "userHash":userHash!,
                                 "resultData":"all", "resultType":"showCase" ]
            if Network.isConnectedToNetwork() == true {
                defaultRequest.getParamsRequest(url: Config.isInit, parameters: parameters) { data in
                    DispatchQueue.main.async {
                        let dataStatus:NSDictionary = data  as NSDictionary.Value as! NSDictionary
                        self.activityView.stopAnimating()
                        if   (dataStatus.object(forKey:"showcase_products") != nil){
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                                
                                DispatchQueue.main.async {
                                    
                                    let showcaseProducts : NSArray = dataStatus.object(forKey: "showcase_products") as! NSArray
                                    self.storeList = showcaseProducts.compactMap{return StoreProtocol(($0 as? [String : AnyObject])!)}
                                    
                                    self.collectionView.reloadData()
                                }
                                
                            }
                        }else{
                            //server error
                        }
                    }
                }
            }else{
                //network error
                self.activityView.stopAnimating()
                print("network not available")
            }
        }
       
    }
    func setStoreRegister(){
        collectionView?.backgroundColor =  UIColor.init(named: "bg")
        collectionView!.register(StoreCell.self, forCellWithReuseIdentifier: reuseId)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! StoreCell
        let activityView = UIActivityIndicatorView(style: .gray)
        if storeList.count > 0{
            if self.storeList[indexPath.row].thumb != nil {
                activityView.center = cell.contentView.center
                cell.contentView.addSubview(activityView)
                activityView.startAnimating()
                
                let imageURL  = self.storeList[indexPath.row].thumb!
                if Network.isConnectedToNetwork() == true {
                    Alamofire.request(imageURL).responseImage { response in
                        if let image = response.result.value {
                            cell.thumbView.image = image
                            cell.title.text = self.storeList[indexPath.row].name!.uppercased()
                            cell.id = self.storeList[indexPath.row].id
                            activityView.stopAnimating()
                        }
                    }
                }
            }
        }
        cell.layer.cornerRadius = 2
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.layer.borderWidth = 0.25
        cell.layer.borderColor = UIColor.init(white: 0.25, alpha: 1.0).cgColor
        
        return cell
    }
    func setTopBar(){
          
        setLeftItems()
        setRightItem(true)
         
    }
    func setLeftItems(){
        let logoImage = UIImage(named: "logoLeft")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = CGRect(x: -10, y: -5, width: 120, height: 44)
        logoImageView.contentMode = .scaleAspectFit
        let logoView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 44))
        logoView.clipsToBounds = false
        logoView.addSubview(logoImageView)
        let logoItem = UIBarButtonItem(customView: logoView)
        navigationItem.leftBarButtonItem = logoItem
        //Center Item LOGO
        
    }
    func setRightItem(_ isTable:Bool){
        let button =  UIButton(type: .custom)
        var store = UIImage()
        
        if (isTable == true){
             store = resizeImage(image: UIImage.init(named: "list")!,width: 24,height: 24)
        }else if (isTable == false){
            store = resizeImage(image: UIImage.init(named: "white_store")!,width: 24,height: 24)
        }
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
            setRightItem(false)
            setTable()
        }else if isShowcase == false  {
            self.isShowcase = true
            setRightItem(true)
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

class StoreCell: UICollectionViewCell{
    var id : String?
    override  init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let title : UILabel = {
        let title  =  UILabel()
        title.textColor = UIColor.init(named: "header")
        title.textAlignment = .left
        title.font = UIFont.systemFont(ofSize: 10)
        return title
    }()
    let thumbView : UIImageView = {
       let image  = UIImageView()
        image.backgroundColor = UIColor.init(named: "border")
        image.translatesAutoresizingMaskIntoConstraints = true
        return image
    }()
    let titleView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
         
        return view
    }()
    let seperator : UIView = {
        let view  = UIView()
        view.backgroundColor = UIColor.init(white: 0.35, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    func setupViews(){
        addSubview(thumbView)
        thumbView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.contentView.frame.width, height: contentView.frame.height*0.85)
        thumbView.clipsToBounds = true
        thumbView.contentMode = .scaleAspectFill
        titleView.addSubview(title)
        title.anchor(top: titleView.topAnchor, left: titleView.leftAnchor   , bottom: nil, right: titleView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: contentView.frame.width, height:  contentView.frame.height*0.15)

        
        addSubview(titleView)
        titleView.anchor(top: thumbView.bottomAnchor, left: leftAnchor, bottom: contentView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: contentView.frame.width, height:  contentView.frame.height*0.15)
        titleView.addSubview(seperator)
        seperator.anchor(top: titleView.topAnchor, left: titleView.leftAnchor, bottom: nil  , right: titleView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: contentView.frame.width, height:  0.5)

        
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
}
