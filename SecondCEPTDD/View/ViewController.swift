//
//  ViewController.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet var vm: ViewModel!
    @IBOutlet weak var table: UITableView!
    private var accountsList:[Account]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = self
        self.table.delegate = self
        
        self.vm = ViewModel()
        
        guard let url = JsonFileLoader().getLocalURL(fromFile: "Accounts", withExtension: "json") else {return}
        guard let data = JsonFileLoader().getData(from: url) else {return}
        self.vm.setAccountsList(using: data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm?.accountsList.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.vm?.accountsList[indexPath.row].kind
        cell.detailTextLabel?.text = "\(self.vm?.accountsList[indexPath.row].balance ?? 0.0)"
        return cell
    }
    
    


}

