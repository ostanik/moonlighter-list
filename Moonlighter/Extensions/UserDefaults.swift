//
//  UserDefaults.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 30/03/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation

extension UserDefaults {

    class func clean() {

        guard let aValidIdentifier = Bundle.main.bundleIdentifier else { return }
        standard.removePersistentDomain(forName: aValidIdentifier)
        standard.synchronize()
    }
}
