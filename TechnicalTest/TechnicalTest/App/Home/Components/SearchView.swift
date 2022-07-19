//
//  SearchView.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 17/07/22.
//

import SwiftUI

struct SearchView: View {
    typealias SearchAction = () -> Void
    
    @Binding var item: String
    var searchAction: SearchAction = {}
    
    var body: some View {
        ZStack {
            if item.isEmpty {
                Text("Ey! anímate y busca algo para tí")
                    .foregroundColor(Color.gray)
                    .fontWeight(.bold)
            }
            
            TextField("", text: $item)
        }.padding([.leading, .trailing], 20)
        Divider()
            .padding([.leading, .trailing], 20)
        
        Button(action: searchAction , label: {
            Text("Buscar")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 11,
                                    leading: 18,
                                    bottom: 11,
                                    trailing: 18))
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue, lineWidth: 1.0)
                    .shadow(color: .white, radius: 6))
        })
        .padding([.leading, .trailing])
    }
}
