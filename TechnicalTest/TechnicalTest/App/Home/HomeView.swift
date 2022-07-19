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
            .toolbar {
                ToolbarItem(placement: .principal){
                    Image("meli banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            }
        }
    }
}

private extension HomeView {
    func search(){
        self.viewModel.searchItem()
    }
    
    func removeQuery() {
        self.viewModel.removeQuery()
    }
}
