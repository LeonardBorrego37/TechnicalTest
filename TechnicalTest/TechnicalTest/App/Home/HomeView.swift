//
//  HomeView.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import SwiftUI
import Resolver

struct HomeView<ViewModelType>: View where ViewModelType: HomeViewModelType {
    
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    @State var isPressing: Bool = false
    @State var isPresentAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if let items = self.viewModel.state.response?.results, !items.isEmpty {
                    ProductListView(listItem: items, removeAction: removeQuery)
                } else {
                    SearchView(item: self.$viewModel.state.query, searchAction: self.search)
                }
                Spacer()
            }
            .blueNavigation
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(NSLocalizedString(LocalizedString.home, comment: LocalizedString.empty))
            .alert(self.viewModel.state.messageError, isPresented: $isPresentAlert) {
                Button(NSLocalizedString(LocalizedString.continuar, comment: LocalizedString.empty), role: .cancel) { }
            }
        }
    }
}

private extension HomeView {
    func search(){
        if self.viewModel.state.query.isEmpty {
            self.isPresentAlert = true
            self.viewModel.setMessage(message: NSLocalizedString(LocalizedString.searchEmpty, comment: LocalizedString.empty))
        } else {
            self.viewModel.searchItem()
        }
    }
    
    func removeQuery() {
        self.viewModel.removeQuery()
    }
}
