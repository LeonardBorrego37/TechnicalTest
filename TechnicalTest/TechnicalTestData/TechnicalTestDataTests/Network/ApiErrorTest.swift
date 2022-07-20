//
//  ApiErrorTest.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 20/07/22.
//

import XCTest
@testable import TechnicalTestData

class ApiErrorTest: XCTestCase {

    func testApiError_WhenReturnUnexceptionError() {
        let error = APIError.unexceptedError
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "Unexcepted error")
    }

    func testApiError_WhenReturnRequestFailedError() {
        let error = APIError.requestFailed
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "Request Failed")
    }
    
    func testApiError_WhenReturnInvalidDataError() {
        let error = APIError.invalidData
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "Invalid Data")
    }
    
    func testApiError_WhenReturnResponseUnsuccessfulError() {
        let error = APIError.responseUnsuccessful
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "Response Unsuccessful")
    }
    
    func testApiError_WhenReturnJsonParsingFailureError() {
        let error = APIError.jsonParsingFailure
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "JSON Parsing Failure")
    }
    
    func testApiError_WhenReturnJsonConversionFailureError() {
        let error = APIError.jsonConversionFailure
        
        XCTAssertNotNil(error)
        XCTAssertTrue(error.localizedDescription == "JSON Conversion Failure")
    }
}
