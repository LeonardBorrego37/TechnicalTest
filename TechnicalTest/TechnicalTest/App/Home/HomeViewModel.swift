//
//  HomeViewModel.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import TechnicalTestCore
import TechnicalTestData
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
                    print(error.localizedDescription)
                    self.setMessage(message: error.localizedDescription)
                    break
                case .finished:
                    print("finished")
                    break
                }
            } receiveValue: { [weak self] response in
                self?.objectWillChange.send()
                print(response ?? "")
                if let response = response, !response.results.isEmpty {
                    self?.state.response = response
                } else {
                    print(NSLocalizedString(LocalizedString.resultEmpty, comment: LocalizedString.empty))
                    self?.setMessage(message: NSLocalizedString(LocalizedString.resultEmpty, comment: LocalizedString.empty))
                }
            }.store(in: &suscribers)
    }
    
    func removeQuery() {
        self.objectWillChange.send()
        self.state.query = LocalizedString.empty
        self.state.response = nil
    }
    
    func setMessage(message: String) {
        self.objectWillChange.send()
        self.state.messageError = message
    }
}
