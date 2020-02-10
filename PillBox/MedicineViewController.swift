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
    
    var user: User! // is set by fetchUser()
    var sortedDoses: [Dose]!
    
    @IBOutlet weak var dosesTableView: UITableView!
    
    
    // I navigation: Vil gerne vise < Medicine, men ikke < Medicine Dose Details (fjern overskrift fra nagigation)
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.title = "Medicine"
        fetchUser()
        sortedDoses = user.doses.sorted()
    }
    
    func fetchUser(){
        let userFetchRequest = NSFetchRequest<User>(entityName: User.entityName)
        do {
            self.user = try self.managedObjectContext.fetch(userFetchRequest)[0]
        } catch {
            self.user = nil
            print("Something went wrong, user is nil: \(error)")
        }
    }
}

extension MedicineViewController: UITableViewDataSource, UITableViewDelegate {
    
    // UITableViewDataSource funcs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.doses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicineDoseCell", for: indexPath)
        cell.textLabel?.text = sortedDoses[indexPath.row].medicine
        //cell.textLabel?.text = user.userName
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "edit"
        return cell
    }
    
    // Optional function from UITableViewDataSource. Der findes også Reordering Table Rows function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    }
    
    // UITableViewDelegate funcs
    
    // MARK: - Navigation
    //For example, if the segue originated from a table view, the sender parameter would identify the table view cell that the user tapped.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DoseDetailsViewController
        destinationVC.managedObjectContext = self.managedObjectContext
        // let tableViewCellSelected = sender as! UITableViewCell
        let selectedRow = dosesTableView.indexPathForSelectedRow?.row ?? 0
        destinationVC.currentDose = sortedDoses[selectedRow]
    }
}
