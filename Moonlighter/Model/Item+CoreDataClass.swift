//
//  Item+CoreDataClass.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 09/04/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject, Decodable, Searchable {

    internal let domainIdentifier = "ostanik.moonlighter.item"

    required convenience public init(from decoder:Decoder) throws {
        guard
            let contextInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Item", in: managedObjectContext)
        else {
            throw CoreDataError.decodeError
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        name = try? values.decode(String.self, forKey: .name)
        culture = try? values.decode(String.self, forKey: .culture)
        itemDescription = try? values.decode(String.self, forKey: .itemDescription)
        stackAmount = (try? values.decode(Int16.self, forKey: .stack)) ?? Int16(0)
        minPrice = (try? values.decode(Double.self, forKey: .minPrice)) ?? Double(0.0)
        maxPrice = (try? values.decode(Double.self, forKey: .maxPrice)) ?? Double(0.0)
    }
}
