//
//  Dosage.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData

class Dosage: NSManagedObject {
    @NSManaged var dose: Dose
    @NSManaged var amount: Int
    @NSManaged var schedule: String
    static var entityName: String { return "Dosage" }
    
    /*
    init(_ dose: Dose, numberOfDoses: Int, whenToTake: DateComponents) {
        self.dose = dose
        self.amount = numberOfDoses
        self.schedule = whenToTake
    }
 */
}
