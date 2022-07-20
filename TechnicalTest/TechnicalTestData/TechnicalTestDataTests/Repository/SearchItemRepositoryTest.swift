//
//  SearchItemRepositoryTest.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 19/07/22.
//

import XCTest
import Combine
@testable import TechnicalTestData
@testable import TechnicalTestCore

class SearchItemRepositoryTest: XCTestCase {

    private var cancellable: AnyCancellable?
    private var sut: SearchItemRepositoryType!
    private var service: NetworkServiceMock!
    private var params: String!
    
    override func setUp() {
        super.setUp()
        params = ""
        service = NetworkServiceMock()
        sut = SearchItemRepository(networkService: service)
    }
    
    override func tearDown() {
        service = nil
        params = nil
        super.tearDown()
    }
    
    func testSearchItemRepository_ResponseSuccess() {
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        NetworkServiceMock.response = DataConstantsTest.searchItemApiResponse
        // When
        self.cancellable = sut.searchItem(item: self.params)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            },
            receiveValue: { response in
                // Then
                XCTAssertNotNil(response)
                expectation.fulfill()
            })
        
        self.wait(for: [expectationFailure, expectation], timeout: 1)
        self.cancellable?.cancel()
    }

}
