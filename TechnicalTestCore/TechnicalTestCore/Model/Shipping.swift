//
//  Shipping.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct Shipping: Codable {
    public var free_shipping: Bool
    public var mode: String
    public var logistic_type: String
    public var store_pick_up: Bool
    
    public init(free_shipping: Bool,
                  mode: String,
                  logistic_type: String,
                  store_pick_up: Bool) {
        self.free_shipping = free_shipping
        self.mode = mode
        self.logistic_type = logistic_type
        self.store_pick_up = store_pick_up
    }
}
