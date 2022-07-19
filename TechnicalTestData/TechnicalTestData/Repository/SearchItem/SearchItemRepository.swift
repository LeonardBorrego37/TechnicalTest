//
//  SearchItemRepository.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Combine
import TechnicalTestCore

final public class SearchItemRepository: BaseRepository {}

extension SearchItemRepository: SearchItemRepositoryType {
    public func searchItem(item: String) -> AnyPublisher<SearchItemModel?, Error> {
    
        let endpoint = APIRequest<SearchItemApiResponse>(
            method: .get,
            relativePath: DataConstants.Endpoint.search,
            parameters: [DataConstants.Values.search : item]
        )
        
        return networkService.request(endpoint,
                                      queue: .main,
                                      retries: 0)
        .map {
            SearchItemResponseWrapper.map($0)
        }
        .eraseToAnyPublisher()
    }
}
