//
//  SaveAccessDelete.swift
//  PillBoxUITests
//
//  Created by Anne Dyhr on 09/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import XCTest
import CoreData

@testable import PillBox

class SaveAccessDelete: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchAllUsers(){
        let managedObjectContext = createMainContextInMemory()
        let dataService = DataService(managedObjectContext: managedObjectContext)
        dataService.seedUser()
        
        //Fetching data
        let userFetchRequest =  NSFetchRequest<User>(entityName: User.entityName)
        do {
            let users = try managedObjectContext.fetch(userFetchRequest)
            print(users)
        } catch {
            print("Something went wrong \(error)")
        }
            }

    // Bruger denne func til at skabe context i memory i stedet for sqlite, så det kan testes
    func createMainContextInMemory() -> NSManagedObjectContext {
        
        // Initialize NSManagedObjectModel
        let modelURL = Bundle.main.url(forResource: "PillBox", withExtension: "momd")
        guard let model = NSManagedObjectModel(contentsOf: modelURL!) else { fatalError("model not found") }
        
        // Configure NSPersistentStoreCoordinator with an NSPersistentStore
        let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
        try! psc.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        
        // Create and return NSManagedObjectContext
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = psc
        
        return context
    }
}
