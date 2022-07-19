//
//  SearchItemModelResponse.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation
import SwiftUI

public struct SearchItemModel: Codable {
    public var results: [ProductDetail]
    
    public init(results: [ProductDetail]) {
        self.results = results
    }
}
