//
//  Joke+CoreDataProperties.swift
//  JokesAPICallsProject
//
//  Created by BrianNjoku on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var category: String
    @NSManaged public var joke: String?
    @NSManaged public var setup: String?
    @NSManaged public var type: String
    @NSManaged public var delivery: String?

}
