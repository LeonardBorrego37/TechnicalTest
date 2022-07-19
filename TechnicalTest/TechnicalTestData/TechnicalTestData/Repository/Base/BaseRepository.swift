//
//  BaseRepository.swift
//  TechnicalTestData
//
//  Created by leonard Borrego on 15/07/22.
//

import Foundation

public class BaseRepository {
    public private(set) var networkService: NetworkServiceType
    
    public init(networkService: NetworkServiceType = NetworkService()) {
        self.networkService = networkService
    }
}
