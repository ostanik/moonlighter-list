//
//  ItemView.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 30/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation
import SwiftUI

struct ItemView : View {

    let name: String?
    let minPrice: Double
    let maxPrice: Double

    var body: some View {
        VStack {
            Spacer().padding(.vertical, 5)
            Text(name ??  "Unknown")
            Spacer().padding(.vertical, 5)
            HStack {
                Text("Min Price: \(String(minPrice))")
                Spacer()
                Text("Max Price: \(String(maxPrice))")
            }
            Spacer().padding(.vertical, 5)
        }
    }
}
