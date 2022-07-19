//
//  NetworkService.swift
//  TechnicalTestData
//
//

import Foundation
import Combine
import Alamofire
import os
public class NetworkService {
    private var urlSession: URLSession
    private var baseURL: URL?
    
    public init(url: String = DataConstants.Network.baseURL, urlSession: URLSession = .shared) {
        self.baseURL = URL(string: url)
        self.urlSession = urlSession
    }
    
    private func getBaseUrl(path: String, parameters: [String: Any] = [:]) -> URL? {
        guard let baseURL = baseURL?.appendingPathComponent(path) else { return nil }
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        
        if !parameters.isEmpty {
            urlComponents.queryItems = parameters.map {
                URLQueryItem(name: $0, value: String(describing: $1))
            }
        }
        
        let url = URL(string: urlComponents.url?.absoluteString.removingPercentEncoding ?? "")
        
        return url
    }
    
    private func getURLRequest<Response>(_ endpoint: APIRequest<Response>) -> URLRequest? {
        var url: URL?
        var httpBody: Data?
        
        if let parameters = endpoint.parameters {
            if endpoint.method != .get {
                let body = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                httpBody = body
                url = getBaseUrl(path: endpoint.relativePath)
            } else {
                url = getBaseUrl(path: endpoint.relativePath, parameters: parameters)
            }
        } else {
            url = getBaseUrl(path: endpoint.relativePath)
        }
        
        guard let requestUrl: URL = url else { return nil }
        
        var request = URLRequest(url: requestUrl)
        request.httpBody = httpBody
        request.httpMethod = endpoint.method.rawValue
        
        return request
    }
}

extension NetworkService: NetworkServiceType {
    public func request<Response>(_ endpoint: APIRequest<Response>,
                                  queue: DispatchQueue,
                                  retries: Int) -> AnyPublisher<Response, Error> where Response : Decodable {
        
        guard let request = getURLRequest(endpoint) else {
            return Fail<Response, Error>(error: APIError.requestFailed)
                .eraseToAnyPublisher()
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .subscribe(on: queue)
            .tryMap { element in
                guard
                    let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else
                { throw URLError(.badServerResponse) }
                
                return element.data
            }
            .decode(type: Response.self, decoder: decoder)
            .mapError { error in
                switch error {
                case is Swift.DecodingError:
                    return APIError.requestFailed
                default:
                    return APIError.unexceptedError
                }
            }
            .eraseToAnyPublisher()
    }
}
