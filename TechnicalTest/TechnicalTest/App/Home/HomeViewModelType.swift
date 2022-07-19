//
//  HomeViewModelType.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import Foundation

public protocol HomeViewModelType: ObservableObject {
    var state: HomeViewModelState { get set }
    func searchItem()
    func removeQuery()
}
