//
//  Settings.swift
//  Panda
//
//  Created by TRA on 24.01.2020.
//  Copyright © 2020 panda. All rights reserved.
//

import UIKit
private let reuseIdentifier = "SettingsCell"

class Settings: UIViewController {
     
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //  Helper Functions
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationItem.title = "Settings"
    }

}

extension Settings: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .ACCOUNT: return AccountOptions.allCases.count
        case .PAYMENT: return PaymentOptions.allCases.count
        case .AFFILIATE: return AffiliateOptions.allCases.count 
        case .TOOLS: return ToolsOptions.allCases.count
        case .SHAREFRENDS: return ShareOptions.allCases.count
        case .SUPPORT:
            print("numberOfRowsInSection",section.description)
        case .LEGAL:
            print("numberOfRowsInSection",section.description)
        case .ABOUT:
            print("numberOfRowsInSection",section.description)
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        
        print("Section is \(section)")
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .lightGray
        title.text = SettingsSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }

        switch section {
        case .ACCOUNT:
            let about = AccountOptions(rawValue: indexPath.row)
            cell.sectionType = about
        case .PAYMENT:
            let payment = PaymentOptions(rawValue: indexPath.row)
            cell.sectionType = payment
        case .AFFILIATE:
            print("cellForRowAt",section.description)
        case .TOOLS:
            print("cellForRowAt",section.description)
        case .SHAREFRENDS:
            print("cellForRowAt",section.description)
        case .SUPPORT:
            print("cellForRowAt",section.description)
        case .LEGAL:
            print("cellForRowAt",section.description)
        case .ABOUT:
            print("cellForRowAt",section.description)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .ACCOUNT:
            print(AccountOptions(rawValue: indexPath.row)?.description)
        case .PAYMENT:
            print(PaymentOptions(rawValue: indexPath.row)?.description)
        case .AFFILIATE:
            print("didSelectRowAt",section.description)
        case .TOOLS:
            print("didSelectRowAt",section.description)
        case .SHAREFRENDS:
            print("didSelectRowAt",section.description)
        case .SUPPORT:
            print("didSelectRowAt",section.description)
        case .LEGAL:
            print("didSelectRowAt",section.description)
        case .ABOUT:
            print("didSelectRowAt",section.description)
        }
    }
}

