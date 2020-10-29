//
//  Settings.swift
//  Settings
//
//  Created by nayhan on 12.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit
private let reuseIdentifier = "SettingCell"

class Settings: UIViewController {
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    let headerColor = UIColor.init(named: "headerBar")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = headerColor
        configure()
    }
    func configure() {
        setTableView() 
        setTopBar()
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
    override func viewWillAppear(_ animated: Bool) {
        title = " "
    }
    override func viewWillDisappear(_ animated: Bool) {
        title = " "
    }
    func setNavbar() {
        title = " "
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = headerColor
    }
    func setTableView() {
        tableView = UITableView(frame: .infinite, style: .grouped)
        tableView.backgroundColor = headerColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        tableView.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height  )
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude + 20))

    }
}

extension Settings: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingSection.allCases.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return " "
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingSection(rawValue: section) else {return 0}
        switch  section {
        case .auth: return AuthSection.allCases.count
        case .addManagment: return AddManagment.allCases.count
        case .message: return Messages.allCases.count
        case .favorites: return Favorites.allCases.count
        case .secureTrade: return SecureTrade.allCases.count
        case .otherSettings: return OtherSettings.allCases.count
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewHeader = UIView()
        viewHeader.layer.borderWidth = 0.5
        viewHeader.backgroundColor = headerColor
         
        viewHeader.layer.borderColor = UIColor.init(white: 0.7, alpha: 1.0).cgColor
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize:16)
        title.text = SettingSection(rawValue: section)?.description
        title.text = title.text!.uppercased()
        title.textColor = UIColor.init(named: "header")
        viewHeader.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints  = false
        title.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor,constant: -4).isActive = true
        title.leftAnchor.constraint(equalTo: viewHeader.leftAnchor,constant: 16).isActive = true
        
        if section != 0 {
            viewHeader.frame = CGRect.init(x: 0, y: 0, width: viewHeader.frame.width, height: 50)
        }
       
      return viewHeader
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
          return 30
        }
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingCell
        
        guard let section = SettingSection(rawValue: indexPath.section) else {return SettingCell()}
        
        switch section {
        case .auth:
            let title = AuthSection(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.init(named: "action")
        case .addManagment:
            let title = AddManagment(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.black
        case .message:
            let title = Messages(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.black
        case .favorites:
            let title = Favorites(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.black
        case .secureTrade:
            let title = SecureTrade(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.black
        case .otherSettings:
            let title = OtherSettings(rawValue: indexPath.row)
            cell.textLabel?.text = title?.description
            cell.textLabel?.textColor = UIColor.black
        }
        cell.accessoryType = .disclosureIndicator
        
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sections = SettingSection(rawValue: indexPath.section) else {return }
        switch sections {
        case .auth:
            for auths in AuthSection.allCases {
                if  AuthSection(rawValue: indexPath.row)!.description.contains(auths.description){
                    switch auths.rawValue {
                    case 0:
                        setLogin()
                    case 1:
                         setRegister()
                    default:
                        break
                    }
                }
            }
             
        case .addManagment:
             print("add")
             for adds in AddManagment.allCases {
                if  AddManagment(rawValue: indexPath.row)!.description.contains(adds.description){
                    switch adds.rawValue {
                    case 0:
                         setPublish()
                    case 1:
                         setInPublish()
                    case 2:
                        qrCodeAddImage()
                    default:
                        break
                    }
                }
            }
        case .message:
            print("add")
        case .favorites:
            print("add")
        case .secureTrade:
            print("add")
        case .otherSettings:
           print("add")
        }
    }
    func setLogin(){
        print("setLogin")
        let upload = Login()
        navigationController?.pushViewController(upload, animated: true)
    }
    func setRegister(){
        print("setRegister")
        let upload = Register()
        navigationController?.pushViewController(upload, animated: true)
    }
      
    func setPublish(){
           print("setPublish")
    }
    func setInPublish(){
           print("setInPublish")
    }
    func qrCodeAddImage(){
        print("qrCodeAddImage")
        let upload = UploadImage()
        navigationController?.pushViewController(upload, animated: true)
    }
    
}

class SettingCell: UITableViewCell {
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
