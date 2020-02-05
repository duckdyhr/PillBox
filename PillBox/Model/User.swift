//
//  User.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.

import Foundation
import UIKit

class User{
    let id = 122
    var userName: String
    var doses: [Dose] = []
    var dosageRegimen: [Dosage] = [] // schedule
    var doseHistory: [TakenDose] = []
    
    init(userName: String = "Anonymous"){
        self.userName = userName
    }
    
    func createDose(name: String, measure: Int, unitType: UnitType) -> Dose{
        let newDose = Dose(medicinName: name, measure: measure, unitType: unitType)
        doses.append(newDose)
        return newDose
    }
    
    func takeDose(dose: Dose, amount: Int, whenTaken: DateComponents) -> TakenDose{
        let newTakenDose = TakenDose(dose, numberOfDoses: amount, whenTaken: whenTaken)
        doseHistory.append(newTakenDose)
        return newTakenDose
    }
    
    func createDosage(dose: Dose, numberOfDoses: Int, whenToTake: DateComponents) -> Dosage {
        let newDosage = Dosage(dose, numberOfDoses: numberOfDoses, whenToTake: whenToTake)
        dosageRegimen.append(newDosage)
        return newDosage
    }
}
