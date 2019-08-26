//
//  CoreDataManager.swift
//  CoreDataCodeable
//
//  Created by Brian Njoku on 8/21/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (_,_ ) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    private init() { }
    
    func getAllPokemon() -> [Pokemon] {
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        let allPokemon = try? context.fetch(fetchRequest)
        return allPokemon ?? []
    }
}

