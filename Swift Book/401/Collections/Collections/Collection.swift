//
//  Collection.swift
//  Collections
//
//  Created by Numan Ayhan on 3.09.2021.
//

import UIKit

class Collection: UIViewController , UICollectionViewDelegateFlowLayout{
    //UICollectionView oluşturulup FlowLayout eklendi.
    lazy var collection : UICollectionView = {
        var cv = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.allowsMultipleSelection = false
        cv.isPagingEnabled = true
        
        cv = UICollectionView.init(frame: .zero,collectionViewLayout: layout)
        return cv
    }()
    
    var collectionSize:CGSize? = CGSize.init(width: 0, height: 0)
    private let cellId = "CollectionCell"
    var collectionList = [String]()
    override func viewDidLoad() {
        
    }
    func setCollection(){
        collectionList.append("A")
        collectionList.append("A")
        
        view.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .green
        collectionSize = CGSize.init(width: view.frame.width, height: 63)
        collection.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collection)
        collection.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 120)
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavbar()
    }
    func setNavbar(){
        if navigationController != nil {
            navigationController?.navigationBar.backgroundColor  = .white
            navigationController?.setNavigationBarHidden(false, animated: true)
            navigationController?.navigationBar.isHidden = false
            view.backgroundColor =  .white
        }
        setCollection()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionSize!
    }
     
}
extension Collection : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionCell
        if indexPath.row == 0 {
            cell?.backgroundColor = .red
            cell?.color = "red"
        }else  if indexPath.row == 1 {
            cell?.backgroundColor = .blue
            cell?.color = "blue"
        }
        print("aa",indexPath.row)
        
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as? CollectionCell
        print(cell?.color)
        
//        if cell?.isSelected == true {
//            cell?.imageView.image   = UIImage(named: "check")
//        }else if cell?.isSelected == false {
//            cell?.imageView.image   = UIImage(named: "noCheck")
//        }
    }
}
