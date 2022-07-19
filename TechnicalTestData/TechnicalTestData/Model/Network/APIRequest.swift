//
//  ApiRequest.swift
//  TechnicalTestData


import Foundation
import Alamofire

public class APIRequest<Response> {
    public let method: HTTPMethod
    public let relativePath: String
    public let parameters: [String: Any]?
    public let parameterEncoding: ParameterEncoding
    public let decode: (Data) throws -> Response
    public let contentType: APIContentType

    public init(method: HTTPMethod = .get,
                relativePath: String, parameters: [String: Any]? = nil,
                parameterEncoding: ParameterEncoding = URLEncoding.default,
                contentType: APIContentType = APIContentType.json,
                decode: @escaping (Data) throws -> Response)
    {
        self.method = method
        self.relativePath = relativePath
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.decode = decode
        self.contentType = contentType
    }
}

public extension APIRequest where Response: Decodable {
    convenience init(method: HTTPMethod = .get,
                     relativePath: String,
                     parameters: [String: Any]? = nil,
                     parameterEncoding: ParameterEncoding = URLEncoding.default,
                     contentType: APIContentType = APIContentType.json)
    {
        self.init(method: method,
                  relativePath: relativePath,
                  parameters: parameters,
                  parameterEncoding: parameterEncoding,
                  contentType: contentType) {
            let decoder = JSONDecoder()
            return try decoder.decode(Response.self, from: $0)
        }
    }
}
