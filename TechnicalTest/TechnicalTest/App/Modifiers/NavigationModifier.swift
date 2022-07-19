//
//  NavigationModifier.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 17/07/22.
//

import Foundation
import SwiftUI

extension View {
    func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
    
    var blueNavigation: some View {
        self.navigationBarColor(UIColor(named: "Background")!, textColor: UIColor.black)
    }
}


struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = textColor
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}
