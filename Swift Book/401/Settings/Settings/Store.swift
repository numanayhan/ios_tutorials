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
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "right"), style: .plain,
                                                                target: self, action: #selector(favPost))
          let btnSearch = UIButton.init(type: .custom)
          btnSearch.setImage(UIImage(named: "right"), for: .normal)
          btnSearch.addTarget(self, action: #selector(favPost), for: .touchUpInside)
          let btnEdit = UIButton.init(type: .custom)
          btnEdit.setImage(UIImage(named: "right"), for: .normal)
          btnEdit.addTarget(self, action: #selector(savePost), for: .touchUpInside)
          let stackview = UIStackView.init(arrangedSubviews: [btnEdit, btnSearch])
          stackview.distribution = .equalSpacing
          stackview.axis = .horizontal
          stackview.alignment = .center
          stackview.spacing = 24
        
        let rightBarButton = UIBarButtonItem(customView: stackview)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
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
