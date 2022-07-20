//
//  DataConstantsTest.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 19/07/22.
//

import Foundation
@testable import TechnicalTestData
@testable import TechnicalTestCore

final class DataConstantsTest {
    
    static let searchItemApiResponse: SearchItemApiResponse = {
        SearchItemApiResponse(results: [ResultItem(id: "",
                                                   site_id: "",
                                                   title: "",
                                                   price: 9000,
                                                   sold_quantity: 0,
                                                   thumbnail: "",
                                                   attributes: [],
                                                   seller_address: SellerAddress(country: Country(id: "", name: ""),
                                                                                 city: City(id: "", name: ""),
                                                                                 state: States(id: "", name: "")))])
    }()
    
    static let searchItemModel: SearchItemModel = {
        SearchItemModel(results: [ProductDetail(id: "",
                                                site_id: "",
                                                title: "",
                                                price: 0,
                                                sold_quantity: 0,
                                                image: "",
                                                attributes: [],
                                                seller_address: SellerAddress(country: Country(id: "", name: ""),
                                                                              city: City(id: "", name: ""),
                                                                              state: States(id: "", name: "")))])
    }()
}
