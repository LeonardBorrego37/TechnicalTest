//
//  App+Injection.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 7/07/22.
//

import Foundation
import Resolver
import TechnicalTestData
import TechnicalTestCore

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerNetworkService()
        registerHomeViewDependency()
    }
    
    public static func registerNetworkService() {
        register(NetworkServiceType.self) {
            let session = URLSession.shared
            
            return NetworkService(url: DataConstants.Network.baseURL,
                                  urlSession: session)
        }
        
    }
    
    public static func registerHomeViewDependency() {
        register(SearchItemRepositoryType.self) {
            return SearchItemRepository(networkService: Resolver.resolve())
        }
        
        register(HomeViewModel.self) {
            
            let interactor = SearchItemInteractor(repository: Resolver.resolve())
            
            return HomeViewModel(interactor: interactor)
        }
        
        register(HomeView.self) {
            return HomeView<HomeViewModel>()
        }
    }
}
