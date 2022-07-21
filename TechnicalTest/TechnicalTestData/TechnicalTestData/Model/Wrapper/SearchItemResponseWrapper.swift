//
//  SearchItemResponseWrapper.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

/// Con la clase SearchItemResponseWrapper se hace un maper entre el objeto response del API y el modelo que sirve para visualizar los datos en la vista. Se realiza de esta manera para que en caso de haber un cambio en la capa datos no se vea afectada la capa app. 

import Foundation
import TechnicalTestCore

public class SearchItemResponseWrapper {
    static func map(_ response: SearchItemApiResponse) -> SearchItemModel {
        let products = response.results?.map { ProductDetail(id: $0.id,
                                                            site_id: $0.site_id,
                                                            title: $0.title,
                                                            price: $0.price,
                                                            sold_quantity: $0.sold_quantity,
                                                            image: $0.thumbnail,
                                                            attributes: $0.attributes,
                                                            seller_address: $0.seller_address) }
        return SearchItemModel(results: products ?? [])
    }
}
