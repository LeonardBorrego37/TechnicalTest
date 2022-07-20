//
//  SearchItemModelTest.swift
//  TechnicalTestCoreTests
//
//  Created by leonard Borrego on 20/07/22.
//

import XCTest
@testable import TechnicalTestCore

class SearchItemModelTest: XCTestCase {

    func testSearchItemModel_WhenReturnObjectSuccess() {
        let searchItemModel = SearchItemModel(
            results: [ProductDetail(id: "",
                                    site_id: "",
                                    title: "",
                                    price: 0,
                                    sold_quantity: 0,
                                    image: "",
                                    attributes: [AttributeItem(name: "",
                                                               value_name: "")],
                                    seller_address: SellerAddress(
                                        country: Country(id: "", name: ""),
                                                                  city: City(id: "", name: ""),
                                                                  state: States(id: "", name: ""))
                                   )]
        )
        
        XCTAssertNotNil(searchItemModel)
    }

}
