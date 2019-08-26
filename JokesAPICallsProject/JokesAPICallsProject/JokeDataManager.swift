//
//  JokeDataManager.swift
//  JokesAPICallsProject
//
//  Created by BrianNjoku on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class JokeDataManager {
    static let shared = JokeDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JokeModel")
        container.loadPersistentStores { (_, _) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() { }
    
    func getAllJokes() -> [Joke] {
        let fetchRequest: NSFetchRequest<Joke> = Joke.fetchRequest()
        let allJokes = try? context.fetch(fetchRequest)
        return allJokes ?? []
    }
    
    func save() {
        guard context.hasChanges else {return}
        try? context.save()
    }
    
    func addJoke(joke: String, setup: String, delivery: String, category: String, type: String) throws -> Joke {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Joke", in: context) else { throw CoreDataError.noSuchEntity}
        let newJoke = Joke(entity: entityDescription, insertInto: context)
        newJoke.category = category
        newJoke.delivery = delivery
        newJoke.joke = joke
        newJoke.setup = setup
        newJoke.type = type
        return newJoke
    }
   
    func removeJoke(joke: Joke){
        context.delete(joke)
        save()
    }
  
}
   
