//
//  SearchItemRepositoryStub.swift
//  TechnicalTestCoreTests
//
//  Created by leonard Borrego on 20/07/22.
//

import Foundation
import Combine
@testable import TechnicalTestCore

final class SearchItemRepositoryStub {
    static var error: Error!
    static var response: SearchItemModel!
}

extension SearchItemRepositoryStub: SearchItemRepositoryType {
    
    func searchItem(item: String) -> AnyPublisher<SearchItemModel?, Error> {
        
        let searchModel = SearchItemRepositoryStub.response!
        
        let publisher = CurrentValueSubject<SearchItemModel?, Error>(searchModel)
        
        if let error = SearchItemRepositoryStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
