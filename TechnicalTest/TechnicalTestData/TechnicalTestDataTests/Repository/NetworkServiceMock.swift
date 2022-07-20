//
//  NetworkServiceMock.swift
//  TechnicalTestDataTests
//
//  Created by leonard Borrego on 19/07/22.
//

import Foundation
import Combine
@testable import TechnicalTestData

final class NetworkServiceMock {
    static var error: Error?
    static var response: SearchItemApiResponse?
}

extension NetworkServiceMock: NetworkServiceType {
    func request<Response>(_ endpoint: APIRequest<Response>, queue: DispatchQueue, retries: Int) -> AnyPublisher<Response, Error> where Response: Decodable {
        var respObject: Response! = nil
        
        if NetworkServiceMock.response != nil {
            respObject = NetworkServiceMock.response as? Response
        }
        
        let publisher = CurrentValueSubject<Response, Error>(respObject)

        if let error = NetworkServiceMock.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
