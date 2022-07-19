//
//  Address.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct Address: Codable {
    public var state_id: String
    public var state_name: String
    public var city_id: String
    public var city_name: String
    
    public init(state_id: String,
                state_name: String,
                city_id: String,
                city_name: String) {
        self.state_id = state_id
        self.state_name = state_name
        self.city_id = city_id
        self.city_name = city_name
    }
}
