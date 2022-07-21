//
//  SplashScreenView.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 21/07/22.
//

import SwiftUI
import Resolver
import SwiftfulLoadingIndicators

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            let view = Resolver.resolve(HomeView<HomeViewModel>.self)
            view
        } else {
            ZStack{
                
                Color("Background")
                
                VStack {
                    VStack {
                        Image("meli")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                        Text("")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                        LoadingIndicator(animation: .threeBallsTriangle,
                                         color: Color.blue,
                                         size: .medium,
                                         speed: .normal)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
                .customNavigation
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
