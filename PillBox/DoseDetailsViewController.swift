//
//  DoseViewController.swift
//  PillBox
//
//  Created by Anne Dyhr on 05/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import UIKit
import CoreData

class DoseDetailsViewController: UIViewController, ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    var currentDose: Dose!
    var changesMade: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dose details"
        // Do any additional setup after loading the view.
        print(currentDose ?? "currentDose not set")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // destinationVC burde være MedicineViewController. Sendes changes med tilbage.
    }
    

}
