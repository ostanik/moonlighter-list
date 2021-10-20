//
//  ContentView.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 29/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var searchText: String = ""
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Type an item to search")
                List {
                    ForEach(items.map { $0 as Item }.whereName(contains: searchText), id: \.id) { item in
                        ItemView(name: item.name, minPrice: item.minPrice, maxPrice: item.maxPrice)
                    }
                }
            }.navigationBarTitle("Item", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
