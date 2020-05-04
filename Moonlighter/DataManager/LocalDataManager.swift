//
//  LocalDataManager.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 29/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct LocalDataManager {

    enum Files: String {

        case items = "items_json"
        case weapons = "weapons_json"
    }

    private struct Content<T: Decodable>: Decodable {
        let content: [T]
    }

    static func loadLocalData<T: Decodable>(from file: Files, with context: NSManagedObjectContext) throws -> [T] {

        guard let asset = NSDataAsset(name: file.rawValue) else { throw FetchError.noLocalData }
        guard let contextKey = CodingUserInfoKey.context else { throw FetchError.noContext }

        let decoder = JSONDecoder()
        decoder.userInfo[contextKey] = context
        let objects = try decoder.decode(Content<T>.self, from: asset.data)

        return objects.content
    }
}
