//
//  datastuff.swift
//  coredataproject
//
//  Created by Brian Njoku on 8/20/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import Foundation
class CoreDataStuff {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExampleModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            print(description)
            print(error)
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func makeDoggy(name: String) throws -> Dog {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Dog", in: context) else { throw CoreDataError.noSuchEntity}
        let newDog = Dog(entity: entityDescription, insertInto: context)
        newDog.name = name
        return newDog
    }
    
    func getAllDogs() -> [Dog] {
        let fetchRequest = NSFetchRequest<Dog>(entityName: "Dog")
        let dogs = try? context.fetch(fetchRequest)
        return dogs ?? []
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
