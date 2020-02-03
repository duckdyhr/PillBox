//
//  Dosage.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation

class Dosage {
    let dose: Dose
    var amount: Int
    var schedule: DateComponents
    
    init(_ dose: Dose, numberOfDoses: Int, whenToTake: DateComponents) {
        self.dose = dose
        self.amount = numberOfDoses
        self.schedule = whenToTake
    }
}
