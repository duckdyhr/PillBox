//
//  Dose.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData

class Dose: NSManagedObject, Comparable {
    
    //@NSManaged var id: UUID?
    @NSManaged var medicine: String
    @NSManaged var measure: Int16 // ratio/volume/weight/load/measure
    @NSManaged var unitType: String?
    // dosageForm (pill, liquid, syrup, cream etc)
    static var entityName: String { return "Dose" }
    
    static func < (first: Dose, second: Dose) -> Bool {
        return first.medicine < second.medicine
    }
    
    /*
    init(medicinName: String, measure: Int, unitType: UnitType) {
        self.medicine = medicinName
        self.measure = measure
        self.unitType = unitType
    }
 */
}
