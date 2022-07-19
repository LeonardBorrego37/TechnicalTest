//
//  CustomError.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 7/07/22.
//

import Foundation

enum APIError: String, LocalizedError, Equatable {
    case unexceptedError
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .unexceptedError: return "Unexcepted error"
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}
