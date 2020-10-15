//
//  TableViewCtrl.swift
//  CustomCell
//
//  Created by nayhan on 14.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.


import UIKit
var  reuseIdentifier = "Cell"
class TableViewCtrl: UIViewController {

    var tableView  = UITableView()
    var list : [Video]  = []
    struct Cells {
        static let videoCell  =  "Cell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title =  "Images"
        setTableView()
        list = fetchAll()
        
        print(list)
        view.backgroundColor = .white
        tableView.reloadData()
    }
    func setTableView(){
        // set delegates, row height , register cell, constraints
        
        view.addSubview(tableView)
        setRegisterTV()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    func setRegisterTV(){
        tableView.delegate  = self
        tableView.dataSource  = self
    }
    
}
extension TableViewCtrl : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video =  list[indexPath.row]
        cell.set(image: video)
        return cell
    }
}
extension  TableViewCtrl{
    
    func fetchAll() -> [Video]{
        let v1 = Video(image: Images.one!, title: "One")
        let v2 = Video(image: Images.two!, title: "Two")
        let v3 = Video(image: Images.one!, title: "One")
        let v4 = Video(image: Images.two!, title: "Two")
        let v5 = Video(image: Images.one!, title: "One")
        let v6 = Video(image: Images.two!, title: "Two")
        return [v1,v2,v3,v4,v5,v6]
    }
}
