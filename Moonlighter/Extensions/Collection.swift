//
//  Collection.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 31/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation
import CoreSpotlight
import MobileCoreServices

extension Collection where Element == Priceble & Identifiable {

    func whereName(contains text: String) -> [Element] {

        return self.filter {
            text.isEmpty ? true : $0.name?.lowercased().contains(text.lowercased()) ?? false
        }.sorted(by: {
            $0.minPrice < $1.minPrice && $0.maxPrice < $1.maxPrice
        })
    }
}

extension Collection where Element == Searchable {

    func indexAsSearchable(_ completion: ((Error?) -> Void)? = nil) {

        let items = self.map { $0.searchableItem() }
        CSSearchableIndex.default().indexSearchableItems(items, completionHandler: completion)
    }
}
