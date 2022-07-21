//
//  SearchItemRepository.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

/// La clase SearchItemRepository es la encargada de construir la estructura request para el consumo del servicio para la busqueda de un articulo en la api de mercado libre.

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
