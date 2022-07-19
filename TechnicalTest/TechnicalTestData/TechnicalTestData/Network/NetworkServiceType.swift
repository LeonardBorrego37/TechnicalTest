//
//  NetworkServiceType.swift
//  TechnicalTestData
//

import Foundation
import Combine

public protocol NetworkServiceType {
    func request<Response>(_ endpoint: APIRequest<Response>,
                           queue: DispatchQueue,
                           retries: Int) -> AnyPublisher<Response, Error> where Response: Decodable
}
