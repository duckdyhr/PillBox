//
//  SecondViewController.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import UIKit
import CoreData

/*
 CRUD dose (se drugstars for inspiration!) Vis liste af user.doses med mulighed for CRUD
 */
class MedicineViewController: UIViewController, ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // I navigation: Vil gerne vise < Medicine, men ikke < Medicine Dose Details (fjern overskrift fra nagigation)
        self.title = "Medicine"
        // Do any additional setup after loading the view.
        user = NSEntityDescription.insertNewObject(forEntityName: "User", into: managedObjectContext) as? User
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DoseDetailsViewController
        destinationVC.managedObjectContext = self.managedObjectContext
    }
}
