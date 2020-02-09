//
//  User.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.

import Foundation
import CoreData

class User: NSManagedObject {
    //let id = 122
    @NSManaged var userName: String
    @NSManaged var doses: [Dose]
    @NSManaged var dosageRegimen: [Dosage]
    @NSManaged var doseHistory: [TakenDose]
    static var entityName: String { return "User" }
    
    
    /*
    init(userName: String = "Anonymous"){
        self.userName = userName
    }
    */
    
    func createDose(name: String, measure: Int, unitType: UnitType) -> Dose{
        //let newDose = Dose(medicinName: name, measure: measure, unitType: unitType)
        let newDose = Dose()
        doses.append(newDose)
        
        return newDose
    }
    
    func takeDose(dose: Dose, amount: Int, whenTaken: NSDate) -> TakenDose{
        //let newTakenDose = TakenDose(dose, numberOfDoses: amount, whenTaken: whenTaken)
        let newTakenDose = TakenDose()
        doseHistory.append(newTakenDose)
        return newTakenDose
    }
    
    func createDosage(dose: Dose, numberOfDoses: Int, whenToTake: DateComponents) -> Dosage {
        //let newDosage = Dosage(dose, numberOfDoses: numberOfDoses, //whenToTake: whenToTake)
        let newDosage = Dosage()
        dosageRegimen.append(newDosage)
        return newDosage
    }
}
