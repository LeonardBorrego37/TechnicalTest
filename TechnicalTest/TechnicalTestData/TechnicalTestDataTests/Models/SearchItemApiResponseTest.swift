//
//  SearchItemApiResponseTest.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 19/07/22.
//

import XCTest
@testable import TechnicalTestData

class SearchItemApiResponseTest: XCTestCase {

    func testSearchItemApiResponse_WhenValidateObjetSuccess() {
        let dataExpectation = DataConstantsTest.searchItemApiResponse
        
        XCTAssertNotNil(dataExpectation)
    }

}
