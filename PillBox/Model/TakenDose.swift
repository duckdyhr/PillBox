//
//  TakenDose.swift
//  PillBox
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation

class TakenDose {
    var dose: Dose
    var amount: Int
    var whenTaken: DateComponents
    
    init(_ dose: Dose, numberOfDoses: Int, whenTaken: DateComponents) {
        self.dose = dose
        self.amount = numberOfDoses
        self.whenTaken = whenTaken
    }
}
