//
//  DataService.swift
//  PillBox
//
//  Created by Anne Dyhr on 09/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
        
        
        // Creating doses
        let doseLitarex = NSEntityDescription.insertNewObject(forEntityName: Dose.entityName, into: self.managedObjectContext) as! Dose
        doseLitarex.medicine = "Litarex"
        doseLitarex.measure = 6
        doseLitarex.unitType = "mmol"
        
        let doseVenlafaxin = NSEntityDescription.insertNewObject(forEntityName: Dose.entityName, into: self.managedObjectContext) as! Dose
        doseVenlafaxin.medicine = "Venlafaxin"
        doseVenlafaxin.measure = 150
        doseVenlafaxin.unitType = "mg"
        
        let doseLongoVital = NSEntityDescription.insertNewObject(forEntityName: Dose.entityName, into: self.managedObjectContext) as! Dose
        doseLongoVital.medicine = "Longo Vital"
        doseLongoVital.measure = 1
        doseLongoVital.unitType = "tabl"
        
        let doseDVitamine = NSEntityDescription.insertNewObject(forEntityName: Dose.entityName, into: self.managedObjectContext) as! Dose
        doseDVitamine.medicine = "D-vitamin"
        doseDVitamine.measure = 35
        doseDVitamine.unitType = "ug"
        
        let doseQuetiapin = NSEntityDescription.insertNewObject(forEntityName: Dose.entityName, into: self.managedObjectContext) as! Dose
        doseQuetiapin.medicine = "Quetiapin"
        doseQuetiapin.measure = 25
        doseQuetiapin.unitType = "mg"
        
        // Creating dosage regimen
        let dosage1 = NSEntityDescription.insertNewObject(forEntityName: Dosage.entityName, into: self.managedObjectContext) as! Dosage
        dosage1.dose = doseLitarex
        dosage1.amount = 2
        dosage1.schedule = "0900"
        
        let dosage2 = NSEntityDescription.insertNewObject(forEntityName: Dosage.entityName, into: self.managedObjectContext) as! Dosage
        dosage2.dose = doseVenlafaxin
        dosage2.amount = 1
        dosage2.schedule = "0900"
        
        
        let dosage3 = NSEntityDescription.insertNewObject(forEntityName: Dosage.entityName, into: self.managedObjectContext) as! Dosage
        dosage3.dose = doseLongoVital
        dosage3.amount = 3
        dosage3.schedule = "0900"
        
        let dosage4 = NSEntityDescription.insertNewObject(forEntityName: Dosage.entityName, into: self.managedObjectContext) as! Dosage
        dosage4.dose = doseDVitamine
        dosage4.amount = 1
        dosage4.schedule = "0900"
        
        let dosage5 = NSEntityDescription.insertNewObject(forEntityName: Dosage.entityName, into: self.managedObjectContext) as! Dosage
        dosage5.dose = doseLitarex
        dosage5.amount = 3
        dosage5.schedule = "2100"
        
        // Taken doses
        let takenDose1 = NSEntityDescription.insertNewObject(forEntityName: TakenDose.entityName, into: self.managedObjectContext) as! TakenDose
        
        takenDose1.dose = doseQuetiapin
        takenDose1.amount = 2
        takenDose1.whenTaken = NSDate()
        
        do{
            try self.managedObjectContext.save()
        } catch {
            print("seedUser not saved \(error)")
            self.managedObjectContext.rollback()
        }
    }
}

