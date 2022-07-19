//
//  Installment.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public struct Installment: Codable {
    public var quantity: Int
    public var amount: Double
    public var rate: Double
    public var currency_id: String
    
    public init(quantity: Int,
                amount: Double,
                rate: Double,
                currency_id: String) {
        self.quantity = quantity
        self.amount = amount
        self.rate = rate
        self.currency_id = currency_id
    }
}
