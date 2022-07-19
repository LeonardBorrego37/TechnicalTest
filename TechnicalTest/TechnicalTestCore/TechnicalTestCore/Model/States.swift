//
//  States.swift
//  TechnicalTestCore
//
//  Created by leonard Borrego on 19/07/22.
//

import Foundation

public struct States: Codable {
    public var id: String
    public var name: String
    
    public init(id: String,
                  name: String) {
        self.id = id
        self.name = name
    }
}
