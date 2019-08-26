//
//  Pokemon+CoreDataClass.swift
//  CoreDataCodeable
//
//  Created by Brian Njoku on 8/21/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Codeable {
    public required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Pokemon",
    in: CoreDataManager.shared.context) else { throw CoreDataError.noSuchEntity }
    super.init(entity: entityDescription, insetInto: CoreDataManager.shared.context)
    
        let conatiner = try decoder.conatiner(keyedBy: CodingKeys.self)
        name = try conatiner.decode(String.self, forKey: .name)
    }
    public func encode(to encoder: Encoder) throws {
        var conatiner = encoder.conatiner
        
        super.init(entity: NSEntityDescription, insertInto: NSManagedObjectContex?)
        
    }

}
