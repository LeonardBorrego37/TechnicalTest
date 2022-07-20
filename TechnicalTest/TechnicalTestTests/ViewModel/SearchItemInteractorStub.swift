//
//  SearchItemInteractorStub.swift
//  TechnicalTestTests
//
//  Created by leonard Borrego on 20/07/22.
//

import Foundation
import Combine
@testable import TechnicalTestCore

final class SearchItemInteractorStub: AnyInteractor<String, SearchItemModel?> {
    static var error: Error!
    static var response: SearchItemModel!
    
    public override func execute(params: String) -> AnyPublisher<SearchItemModel?, Error> {
        
        let publisher = CurrentValueSubject<SearchItemModel?, Error>(SearchItemInteractorStub.response)
        
        if let error = SearchItemInteractorStub.error {
            publisher.send(completion: .failure(error))
        }
        
        return publisher.eraseToAnyPublisher()
    }
}
