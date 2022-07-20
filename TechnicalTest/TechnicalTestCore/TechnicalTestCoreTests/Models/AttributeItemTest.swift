//
//  AttributeItemTest.swift
//  TechnicalTestCoreTests
//
//  Created by leonard Borrego on 20/07/22.
//

import XCTest
@testable import TechnicalTestCore

class AttributeItemTest: XCTestCase {

    func testAttributeItem_WhenReturnObjectSuccess() {
        let attributeItem = AttributeItem(name: "", value_name: "")
        
        XCTAssertNotNil(attributeItem)
    }

}
