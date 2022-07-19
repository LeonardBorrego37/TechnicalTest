//
//  SellerAddress.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct SellerAddress: Codable {
    public var country: Country
    public var city: City
    public var state: States
    
    public init(country: Country,
                  city: City,
                  state: States) {
        self.country = country
        self.city = city
        self.state = state
    }
}
