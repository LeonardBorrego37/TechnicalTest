//
//  TechnicalTestApp.swift
//  TechnicalTest

import SwiftUI
import Resolver

@main
struct TechnicalTestApp: App {

    var body: some Scene {
        WindowGroup {
            let view = Resolver.resolve(HomeView<HomeViewModel>.self)
            view
        }
    }
}
