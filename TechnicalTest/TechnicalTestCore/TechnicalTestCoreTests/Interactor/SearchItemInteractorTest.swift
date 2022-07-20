//
//  SearchItemInteractorTest.swift
//  TechnicalTestCoreTests
//
//  Created by leonard Borrego on 20/07/22.
//
import Combine
import XCTest
@testable import TechnicalTestCore

class SearchItemInteractorTest: XCTestCase {

    var cancellable: AnyCancellable?
    var sut: AnyInteractor<String, SearchItemModel?>!
    private var searchRepository: SearchItemRepositoryType!
    private var params: String!
    
    override func setUp() {
        super.setUp()
        searchRepository = SearchItemRepositoryStub()
        sut = SearchItemInteractor(repository: searchRepository)
        params = ""
    }
    
    override func tearDown() {
        searchRepository = nil
        sut = nil
        cancellable = nil
        SearchItemRepositoryStub.error = nil
        SearchItemRepositoryStub.response = nil
        params = nil
        super.tearDown()
    }
    
    func testSearchItemInteractor_WhenResponseSuccess() {
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "search item")
        expectationFailure.isInverted = true
        
        SearchItemRepositoryStub.response = SearchItemModel(
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
                                   )])
        
        cancellable = sut.execute(params: params)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                XCTFail(error.localizedDescription)
                expectationFailure.fulfill()
            }, receiveValue: { response in
                XCTAssertNotNil(response)
                expectation.fulfill()
            })
        
        wait(for: [expectationFailure, expectation], timeout: 1)
        cancellable?.cancel()
    }
}
