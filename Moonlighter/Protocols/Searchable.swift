//
//  Searchable.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 09/04/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import CoreSpotlight
import MobileCoreServices

protocol Identifiable {
    var id: UUID? { get }
    var name: String? { get }
}

protocol Priceble {
    var minPrice: Double { get }
    var maxPrice: Double { get }
}

protocol Searchable: Identifiable, Priceble {
    var domainIdentifier: String { get }
}

extension Searchable {

    private var attributeSet: CSSearchableItemAttributeSet {

        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeContact as String)
        attributeSet.title = name
        attributeSet.contentDescription = "Min:\(minPrice) - Max:\(maxPrice)"
        return attributeSet
    }

    func index(_ completion: ((Error?) -> Void)? = nil) {

        let item = CSSearchableItem(uniqueIdentifier: id?.uuidString, domainIdentifier: domainIdentifier, attributeSet: attributeSet)
        CSSearchableIndex.default().indexSearchableItems([item], completionHandler: completion)
    }

    func searchableItem() -> CSSearchableItem {

        return  CSSearchableItem(uniqueIdentifier: id?.uuidString, domainIdentifier: domainIdentifier, attributeSet: attributeSet)
    }
}
