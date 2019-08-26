//
//  Pokemon+CoreDataProperties.swift
//  CoreDataCodeable
//
//  Created by Brian Njoku on 8/21/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var attribute: String?

}
