//
//  Dose.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData

class Dose: NSManagedObject {
    @NSManaged var id: UUID?
    @NSManaged var medicine: String
    @NSManaged var measure: Int // ratio/volume/weight/load/measure
    @NSManaged var unitType: String?
    // dosageForm (pill, liquid, syrup, cream etc)
    static var entityName: String { return "Dose" }
    
    /*
    init(medicinName: String, measure: Int, unitType: UnitType) {
        self.medicine = medicinName
        self.measure = measure
        self.unitType = unitType
    }
 */
    
    // Da NSManagedObject subklasser ikke kan have init()s, bruges awakeFromInsert i stedet til at initializere speciale default values
    override func awakeFromInsert() {
        
    }
}

enum UnitType: String {
    case MG = "mg."
    case MMOL = "mmol."
    case SPOONFUL = "tbsp."
    case DROP = "drop"
    case OINTMENT = "ointment"
    case MICROGRAM = "microgram" // UG/mcg
    case TABL = "tablet"
}
