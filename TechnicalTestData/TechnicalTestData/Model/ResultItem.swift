//
//  ResultItem.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation
import TechnicalTestCore

public struct ResultItem: Codable {
    public var id: String
    public var site_id: String
    public var title: String
    public var price: Int
    public var sold_quantity: Int
    public var thumbnail: String
    public var attributes: [AttributeItem]
    public var seller_address: SellerAddress

    public init(id: String,
                site_id: String,
                title: String,
                price: Int,
                sold_quantity: Int,
                thumbnail: String,
                attributes: [AttributeItem],
                seller_address: SellerAddress) {
        self.id = id
        self.site_id = site_id
        self.title = title
        self.price = price
        self.sold_quantity = sold_quantity
        self.thumbnail = thumbnail
        self.attributes = attributes
        self.seller_address = seller_address
    }
}
