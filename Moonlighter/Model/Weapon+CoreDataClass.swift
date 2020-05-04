//
//  Weapon+CoreDataClass.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 09/04/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Weapon)
public class Weapon: NSManagedObject, Decodable, Searchable {

    internal let domainIdentifier = "ostanik.moonlighter.weapon"

    required convenience public init(from decoder:Decoder) throws {
        guard
            let contextInfoKey = CodingUserInfoKey.context,
            let managedObjectContext = decoder.userInfo[contextInfoKey] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Weapon", in: managedObjectContext)
        else {
            throw CoreDataError.decodeError
        }

        self.init(entity: entity, insertInto: managedObjectContext)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        name = try? values.decode(String.self, forKey: .name)
        culture = try? values.decode(String.self, forKey: .culture)
        weaponDescription = try? values.decode(String.self, forKey: .itemDescription)
        stack = (try? values.decode(Int16.self, forKey: .stack)) ?? Int16(0)
        minPrice = (try? values.decode(Double.self, forKey: .minPrice)) ?? Double(0.0)
        maxPrice = (try? values.decode(Double.self, forKey: .maxPrice)) ?? Double(0.0)
    }
}
