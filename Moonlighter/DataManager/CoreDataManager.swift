//
//  CoreDataManager.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 29/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {

    private enum Constant {
        static let launchedKey = "launchedKey"
    }

    static func setupDataIfNeeded(_ userDefaults: UserDefaults = UserDefaults.standard, context: NSManagedObjectContext) throws {

        if !userDefaults.bool(forKey: Constant.launchedKey) {

            userDefaults.set(true, forKey: Constant.launchedKey)

            let items = try LocalDataManager.loadLocalData(from: .items, with: context) as [Item]

            let weapons = try LocalDataManager.loadLocalData(from: .weapons, with: context) as [Weapon]
            weapons.forEach { $0.index() }
        }
    }
}

extension NSManagedObject {

    func setRawValue<ValueType: RawRepresentable>(value: ValueType, forKey key: String) {

        self.willChangeValue(forKey: key)
        self.setPrimitiveValue(value.rawValue, forKey: key)
        self.didChangeValue(forKey: key)
    }

    func rawValueForKey<ValueType: RawRepresentable>(key: String) -> ValueType? {

        self.willAccessValue(forKey: key)
        let result = self.primitiveValue(forKey: key) as! ValueType.RawValue
        self.didAccessValue(forKey: key)
        return ValueType(rawValue: result)
    }
}
