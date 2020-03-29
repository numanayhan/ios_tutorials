//
//  ViewController.swift
//  TableView
//
//  Created by TRA on 20.03.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
public struct User{
    var Id: Int
    var FullName: String
    
}

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var personList = [Int]()
    
    var arr = [0,1,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = [
            User(Id: 0, FullName: "Süleyman"),
            User(Id: 1,FullName: ""),
            User(Id: 2,FullName: "Ali"),
            User(Id: 3,FullName: ""),
            User(Id: 4,FullName: "Kamil")
            
        ]
        print(users)
        for (index,user) in users.enumerated(){
            
            if index % 2 != 0{
                
                let element = User(Id: 2,FullName: "Bora")
                if index == 1{
                    users.insert(element, at: 2)
                    users.insert(User(Id: 1,FullName: ""), at: index + 2)
                }
            }
            let after = index
            print("after",after)
        }
        tableViewConfig()
        
        self.tableView.reloadData()
    }
    func rearrange<T>(array: Array<T>, fromIndex: Int, toIndex: Int, newElement:User) -> Array<T>{
        var arr = array
        let element = arr.remove(at:fromIndex)
        arr.insert(element, at: toIndex)
        return arr
    }
    func tableViewConfig(){
        tableView?.register(PersonCell.nib, forCellReuseIdentifier: PersonCell.identifier)
        tableView?.allowsMultipleSelection = false
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.allowsMultipleSelectionDuringEditing = false
        tableView?.separatorStyle = .none
        tableView?.separatorColor = UIColor.init(white:0.0, alpha: 0.3)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PersonCell.identifier, for: indexPath) as? PersonCell {
            if self.users[indexPath.row].Id % 2 == 0 {
                cell.detail.text = users[indexPath.row].FullName
                cell.add.setTitle("A", for: .normal)
            } else {
                cell.detail.text = String(1)
                cell.detail.isHidden = true
                cell.add.setTitle("+", for: .normal)
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = tableView.cellForRow(at: indexPath)! as! PersonCell
        print("didSelectRowAt",indexPath.row)
        
        if indexPath.row % 2 != 0  {
            AddNewValue(index:indexPath.row)
        }
        
        
    }
    func AddNewValue(index:Int){
        print("index Add ", index)
        let alert = UIAlertController(title: "Add", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Write New "
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text {
                print("textFields",name)
                for (index,user) in self.users.enumerated(){
                    
                    if index % 2 != 0{
                        let element = User(Id: 2,FullName: name)
                        if index == 1{
                            self.users.insert(element, at: 2)
                            self.users.insert(User(Id: 1,FullName: ""), at: index + 2)
                        }
                    }
                }
                print("users",self.users)
                
                self.tableView.reloadData()
            }
            
            
            
            
        }))
        self.present(alert, animated: true)
    }
}



