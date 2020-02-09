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
    @NSManaged var id: UUID
    @NSManaged var medicine: String
    @NSManaged var measure: Int // ratio/volume/weight/load/measure
    var unitType: UnitType = .MG
    // dosageForm (pill, liquid, syrup, cream etc)
    @NSManaged var unitTypeAsString: String?
    
    init(medicinName: String, measure: Int, unitType: UnitType) {
        self.medicine = medicinName
        self.measure = measure
        self.unitType = unitType
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
