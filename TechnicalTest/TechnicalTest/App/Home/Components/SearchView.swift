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
        Image(NSLocalizedString(LocalizedString.image, comment: LocalizedString.empty))
            .frame(width: 100, height: 100)
        Spacer()
        ZStack {
            if item.isEmpty {
                Text(NSLocalizedString(LocalizedString.homeMessage, comment: LocalizedString.empty))
                    .foregroundColor(Color.gray)
                    .fontWeight(.bold)
            }
            
            TextField(LocalizedString.empty, text: $item)
        }.padding([.leading, .trailing], 20)
        Divider()
            .padding([.leading, .trailing], 20)
        
        Button(action: searchAction , label: {
            Text(NSLocalizedString(LocalizedString.searchButton, comment: LocalizedString.empty))
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
