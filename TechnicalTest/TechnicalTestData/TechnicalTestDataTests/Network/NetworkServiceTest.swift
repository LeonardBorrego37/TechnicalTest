//
//  NetworkServiceTest.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 19/07/22.
//

import XCTest
@testable import TechnicalTestData

class NetworkServiceTest: XCTestCase {

    private var sut: NetworkServiceType!
    private var session: URLSession!
    
    static let baseURL = "https://api.mercadolibre.com"
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        session = URLSession(configuration: config)
        
        sut = NetworkService(url: NetworkServiceTest.baseURL,
                             urlSession: session)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        URLProtocolMock.testURLs = [:]
        URLProtocolMock.error = nil
        URLProtocolMock.response = nil
    }
    
    func testNetworkService_WhenMakeRequestSuccessfull_ThenTheResponseShouldBeSuccess() throws{
        
        let endpoint = APIRequest<SearchItemApiResponse>(
            method: .get,
            relativePath: DataConstants.Endpoint.search,
            parameters: [DataConstants.Values.search : "Moto"]
        )
        
        let decoder = JSONEncoder()
        let encodedData = try decoder.encode(DataConstantsTest.searchItemApiResponse)
        let jsonString = String(data: encodedData, encoding: .utf8)
        let jsonData = jsonString!.data(using: .utf8)!
        
        let searchURL = URL(string: NetworkServiceTest.baseURL + "/sites/MCO/search")!

        
        URLProtocolMock.testURLs = [searchURL: jsonData]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://localhost:5000")!,
                                                   statusCode: 200,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        
        let test = evalValidResponseTest(publisher: sut.request(endpoint,
                                                                queue: .main,
                                                                retries: 0))
        wait(for: test.expectations, timeout: 1)
        test.cancellable?.cancel()
    }
    
    func testNetworkService_WhenInvalidURL_ThenCatchAError() throws {
        // Arrange
        sut = NetworkService(url: "", urlSession: session)

        let endpoint = APIRequest<SearchItemApiResponse>(
            method: .get,
            relativePath: DataConstants.Endpoint.search,
            parameters: [DataConstants.Values.search : "Moto"]
        )

        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://localhost:5000/")!,
                                                   statusCode: 500,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        URLProtocolMock.error = APIError.requestFailed
        // When
        let test = evalInvalidResponseTest(publisher: sut.request(endpoint, queue: .main, retries: 0))

        // Then
        wait(for: test.expectations, timeout: 1)
        test.cancellable?.cancel()
    }
}
