//
//  FetchError.swift
//  Moonlighter
//
//  Created by Alan Ostanik on 09/04/2020.
//  Copyright © 2020 Alan Ostanik. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case noLocalData
    case unownedType
    case noContext
}
