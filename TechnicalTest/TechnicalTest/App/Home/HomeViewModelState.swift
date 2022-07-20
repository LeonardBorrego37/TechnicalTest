//
//  HomeViewModelState.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import Foundation
import TechnicalTestCore

final public class HomeViewModelState: ObservableObject {
    @Published var isSearch: Bool = false
    @Published var response: SearchItemModel?
    @Published var query: String = LocalizedString.empty
    @Published var messageError: String = LocalizedString.empty
}
