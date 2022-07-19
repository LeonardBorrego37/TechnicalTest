//
//  AttributeItem.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct AttributeItem: Codable {
    public var name: String
    public var value_name: String?
    
    public init(name: String,
                value_name: String) {
        self.name = name
        self.value_name = value_name
    }
}
