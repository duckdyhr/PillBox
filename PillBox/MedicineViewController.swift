//
//  SecondViewController.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import UIKit

/*
 CRUD dose (se drugstars for inspiration!) Vis liste af user.doses med mulighed for CRUD
 */
class MedicineViewController: UIViewController {
    var user = Service.shared().user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // I navigation: Vil gerne vise < Medicine, men ikke < Medicine Dose Details (fjern overskrift fra nagigation)
        self.title = "Medicine"
        // Do any additional setup after loading the view.
    }
}
extension MedicineViewController: UITableViewDataSource, UITableViewDelegate {
    
    // UITableViewDataSource funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.doses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineDoseCell", for: indexPath)
        cell.textLabel?.text = user.doses[indexPath.row].medicine
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "edit"
        return cell
    }
    
    // Optional function from UITableViewDataSource. Der findes også Reordering Table Rows function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
    }
    
    // UITableViewDelegate funcs
}
