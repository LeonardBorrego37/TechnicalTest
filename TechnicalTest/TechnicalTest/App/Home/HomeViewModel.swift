//
//  HomeViewModel.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import TechnicalTestCore
import Combine
import SwiftUI
import os

final class HomeViewModel {
    private var interactor: AnyInteractor<String, SearchItemModel?>
    @Published var state = HomeViewModelState()
    var suscribers: Set<AnyCancellable> = []
    
    init(interactor: AnyInteractor<String, SearchItemModel?>) {
        self.interactor = interactor
    }
}

extension HomeViewModel: HomeViewModelType {
    func searchItem() {
        self.interactor.execute(params: self.state.query)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    //TODO: Validar cuando es fallido
                    print(error)
                    break
                case .finished:
                    //TODO: Validar el finished
                    break
                }
            } receiveValue: { [weak self] response in
                self?.objectWillChange.send()
                self?.state.response = response
            }.store(in: &suscribers)
    }
    
    func removeQuery() {
        self.objectWillChange.send()
        self.state.query = ""
        self.state.response = nil
    }
}
