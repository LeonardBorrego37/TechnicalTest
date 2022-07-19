//
//  City.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct City: Codable {
    public var id: String
    public var name: String
    
    public init(id: String,
                  name: String) {
        self.id = id
        self.name = name
    }
}
