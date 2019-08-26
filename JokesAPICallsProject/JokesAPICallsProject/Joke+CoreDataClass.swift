//
//  Joke+CoreDataClass.swift
//  JokesAPICallsProject
//
//  Created by BrianNjoku on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation 
import CoreData

@objc(Joke)
public class Joke: NSManagedObject, Codable {

    enum CodingKeys: String, CodingKey {
        case category
        case type
        case joke
        case setup
        case delivery
    }
    
    public convenience required init (from decoder: Decoder) throws {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Joke", in: JokeDataManager.shared.context) else { throw CoreDataError.noSuchEntity }
            self.init(entity: entityDescription, insertInto: nil)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decode(String.self, forKey: .category)
        type = try container.decode(String.self, forKey: .type)
        if ( type == "single") {
            joke = try container.decode(String.self, forKey: .joke)
        } else if (type == "twopart") {
            setup = try container.decode(String.self, forKey: .setup)
            delivery = try container.decode(String.self, forKey: .delivery)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(category, forKey: .category)
        try container.encode(type, forKey: .type)
        
        if ( type == "single") {
            try container.encode(joke, forKey: .joke)
        } else if (type == "twopart") {
            try container.encode(setup, forKey: .setup)
            try container.encode(delivery, forKey: .delivery)
        }
    }
}

enum CoreDataError: Error {
    case noSuchEntity
}
