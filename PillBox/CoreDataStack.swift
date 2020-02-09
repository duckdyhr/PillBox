//
//  CoreDataStack.swift
//  PillBox
//
//  Created by Anne Dyhr on 08/02/2020.
//  Copyright © 2020 duckdyhr Inc. All rights reserved.
//

import Foundation
import CoreData

func createMainContext() -> NSManagedObjectContext {
    // Initialize NSManagedObjectsModel
    let modelURL = Bundle.main.url(forResource: "PillBox", withExtension: "momd")
    guard let model = NSManagedObjectModel(contentsOf: modelURL!) else { fatalError("model not found") }
    
    // Configure NSPersistentStoreCoordinator with an NSPersistentStore
    let psc = NSPersistentStoreCoordinator(managedObjectModel: model)
    let storeURL = URL.documentsURL.appendingPathComponent("PillBox.sqlite")
    
    // TODO! Use migrations
    // Temporary solution: Sletter DB for at sikre den er opdateret med datamodellen (klares med migrations senere)
    try! FileManager.default.removeItem(at: storeURL)
    
    // Create and return NSManagedObjectContext
    try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = psc

    return context
}

extension URL {
    static var documentsURL: URL {
        return try! FileManager
            .default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
}

protocol ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext! { get set}
}
