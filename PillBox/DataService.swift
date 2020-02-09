//
//  DataService.swift
//  PillBox
//
//  Created by Anne Dyhr on 09/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData

struct DataService: ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    
    func seedUser(){
        //        let takenMorning = NSDate()
        //        let takenEvening = NSDate()
        //        let morning = DateComponents(hour: 8)
        //        let evening = DateComponents(hour: 20)
        
        let user = NSEntityDescription.insertNewObject(
            forEntityName: User.entityName,
            into: self.managedObjectContext) as! User
        user.userName = "duckdyhr"
        
        
        
        do{
            try self.managedObjectContext.save()
        } catch {
            print("seedUser not saved \(error)")
            self.managedObjectContext.rollback()
        }
    }
}
