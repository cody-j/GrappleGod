//
//  CoreDataManager.swift
//  GrappleGod
//
//  Created by codyj on 2019-12-23.
//  Copyright © 2019 The Local Bodega. All rights reserved.
//

import CoreData

final class CoreDataManager {
    
    // Mark: Properties
    
//    static var sharedInstance = CoreDataManager(modelName: "GameData")
    
    private let modelName: String
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {

        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator

        return managedObjectContext

    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to find data model in bundle")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load data model")
        }
        
        return managedObjectModel
        
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        
        // Use Library I think.
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        
        do {

            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: nil)

        } catch {
            fatalError("Unable to load persistent store")
        }
        
        return persistentStoreCoordinator
        
    }()
    
    
    
    private init(modelName: String) {
        self.modelName = modelName
    }
    
    // Mark: Methods
    
    func getSettings() -> Any {
        let moc = CoreDataManager.sharedInstance.managedObjectContext
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Settings")
        
        do {
            let results: [Any] = try moc.fetch(request)
            
            if results.isEmpty {
                self.initializeSettings()
                
                let results: [Any] = try moc.fetch(request)
                return results[0]
            }
            
            return results[0]
        } catch {
            fatalError("Could not get game settings... oof.")
        }
        
    }
    
    func initializeSettings() -> Void {
        let moc = CoreDataManager.sharedInstance.managedObjectContext
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Settings", in: moc)!
        let settings = SettingsMO(entity: entityDescription, insertInto: moc)
        
        do {
            try moc.save()
        } catch let error as NSError {
            print("Could not save settings")
        }
    }
    
    
    
    
}
