//
//  SearchItemRepositoryType.swift
//  TechnicalTestCore
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation
import Combine

public protocol SearchItemRepositoryType {
    func searchItem(item: String) -> AnyPublisher<SearchItemModel?, Error>
}
