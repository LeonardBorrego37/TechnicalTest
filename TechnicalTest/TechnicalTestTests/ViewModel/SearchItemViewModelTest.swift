//
//  SearchItemViewModelTest.swift
//  TechnicalTestTests
//
//  Created by leonard Borrego on 20/07/22.
//

import XCTest
import Resolver
@testable import TechnicalTest
@testable import TechnicalTestCore
@testable import TechnicalTestData

final class SearchItemViewModelTest: XCTestCase {
    
    var searchItemInteractorStub: AnyInteractor<String, SearchItemModel?>!
    private var sut: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        searchItemInteractorStub = SearchItemInteractorStub()
        sut = HomeViewModel(interactor: searchItemInteractorStub)
    }
    
    override func tearDown() {
        searchItemInteractorStub = nil
        sut = nil
        super.tearDown()
    }
    
    func testSearchItemViewModel_WhenSearchItemReturnSuccess() {
        let expectation = XCTestExpectation(description: "Search items")
        
        SearchItemInteractorStub.response = SearchItemModel(
            results: [ProductDetail(id: "",
                                    site_id: "",
                                    title: "",
                                    price: 0,
                                    sold_quantity: 0,
                                    image: "",
                                    attributes: [AttributeItem(name: "",
                                                               value_name: "")],
                                    seller_address: SellerAddress(
                                        country: Country(id: "",
                                                         name: ""),
                                        city: City(id: "",
                                                   name: ""),
                                        state: States(id: "",
                                                      name: ""))
                                   )])
        
        sut.searchItem()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            if let result = sut.state.response?.results {
                XCTAssertFalse(result.isEmpty)
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchItemViewModel_WhenSearchItemReturnError() {
        let expectation = XCTestExpectation(description: "Search items")
        
        SearchItemInteractorStub.error = APIError.invalidData
        
        sut.searchItem()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertFalse(sut.state.messageError.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchItemViewModel_WhenRemoveQuery() {
        
        sut.state.response? = SearchItemModel(
            results: [ProductDetail(id: "",
                                    site_id: "",
                                    title: "",
                                    price: 0,
                                    sold_quantity: 0,
                                    image: "",
                                    attributes: [AttributeItem(name: "",
                                                               value_name: "")],
                                    seller_address: SellerAddress(
                                        country: Country(id: "",
                                                         name: ""),
                                        city: City(id: "",
                                                   name: ""),
                                        state: States(id: "",
                                                      name: ""))
                                   )])
        
        sut.removeQuery()
        
        XCTAssertNil(sut.state.response)
        
    }
    
    func testSearchItemViewModel_WhenSetMessage() {
        
        sut.state.messageError = ""
        
        let newMessage: String = "Servicio falló"
        
        sut.setMessage(message: newMessage)
        
        XCTAssertTrue(!sut.state.messageError.isEmpty)
    }
    
}
