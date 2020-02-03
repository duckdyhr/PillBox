//
//  UserTests.swift
//  PillBoxTests
//
//  Created by Anne Dyhr on 03/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import XCTest
@testable import PillBox

class UserTests: XCTestCase {
    var user: User!
    let dayAndTime = DateComponents(year: 2020, month: 1, day: 2, hour: 9)
    let morning = DateComponents(hour: 9)
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = User(userName: "TestUser")
        _ = user.createDose(name: "Litarex", measure: 6, unitType: .MMOL)
        _ = user.createDose(name: "Venlafaxin", measure: 150, unitType: .MG)
        _ = user.createDose(name: "Longo Vital", measure: 1, unitType: .TABL)
        _ = user.createDose(name: "D vitamin", measure: 35, unitType: .MICROGRAM)
        _ = user.takeDose(dose: user.doses[0], amount: 2, whenTaken: dayAndTime)
        _ = user.takeDose(dose: user.doses[1], amount: 1, whenTaken: dayAndTime)
        _ = user.takeDose(dose: user.doses[2], amount: 3, whenTaken: dayAndTime)
        _ = user.createDosage(dose: user.doses[0], numberOfDoses: 3, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[1], numberOfDoses: 1, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[2], numberOfDoses: 3, whenToTake: morning)
        _ = user.createDosage(dose: user.doses[3], numberOfDoses: 1, whenToTake: morning)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        user = nil
    }

   func testUserName(){
        XCTAssertEqual(user.userName, "TestUser", "Error: Username doesn't match")
    }
    
    func testCreateDose(){
        XCTAssertEqual(user.doses.count, 4)
    }
    
    func testTakeDose(){
        XCTAssertEqual(user.doseHistory.count, 3)
        let newDosage = user.takeDose(dose: user.doses[3], amount: 1, whenTaken: dayAndTime)
        XCTAssertEqual(user.doseHistory.count, 4)
        XCTAssertEqual(user.doseHistory[3].dose.medicine, newDosage.dose.medicine)
    }
    
    func testCreateRegularMedicine(){
        XCTAssertEqual(user.dosageRegimen.count, 4)
    }
}
