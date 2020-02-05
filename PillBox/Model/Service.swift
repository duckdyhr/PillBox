//
//  Service.swift
//  PillBox
//
//  Created by Anne Dyhr on 04/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import UIKit
// make singleton!
class Service {
    private static let sharedService = Service()
    var user: User
    private init(){
        user = Service.getTestUser()
    }
    class func shared() -> Service {
        return sharedService
    }
    
    
    static func getTestUser() -> User{
        let user: User = User(userName: "duckdyhr")
        let takenMorning = DateComponents(year: 2020, month: 1, day: 2, hour: 9)
        let takenEvening = DateComponents(year: 2020, month: 1, day: 3)
        let morning = DateComponents(hour: 8)
        let evening = DateComponents(hour: 20)
        
        // Creating doses
        _ = user.createDose(name: "Litarex", measure: 6, unitType: .MMOL)
        _ = user.createDose(name: "Venlafaxin", measure: 150, unitType: .MG)
        _ = user.createDose(name: "Longo Vital", measure: 1, unitType: .TABL)
        _ = user.createDose(name: "D vitamin", measure: 35, unitType: .MICROGRAM)
        _ = user.createDose(name: "Quetianpin", measure: 25, unitType: .MG)
        
        // Creating dosage regimen
        _ = user.createDosage(dose: user.doses[0], numberOfDoses: 2, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[1], numberOfDoses: 1, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[2], numberOfDoses: 3, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[3], numberOfDoses: 1, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[0], numberOfDoses: 3, whenToTake: evening)
        
        // Take medicine
        _ = user.takeDose(dose: user.doses[0], amount: 2, whenTaken: takenMorning)
        _ = user.takeDose(dose: user.doses[1], amount: 1, whenTaken: takenMorning)
        _ = user.takeDose(dose: user.doses[2], amount: 3, whenTaken: takenEvening)
        _ = user.takeDose(dose: user.doses[4], amount: 2, whenTaken: takenEvening)
        return user
    }
}
