//
//  SearchView.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 17/07/22.
//

import SwiftUI

struct SearchView: View {
    typealias SearchAction = () -> Void
    
    @Environment(\.verticalSizeClass) var sizeClass: UserInterfaceSizeClass?
    @Binding var item: String
    var searchAction: SearchAction = {}
    
    var body: some View {
        if sizeClass == .regular {
            image
            Spacer()
            searchText
        } else {
            HStack{
                image
                searchText
            }.padding()
        }
    }
    
    @ViewBuilder
    var image: some View {
        if sizeClass == .regular {
            Image(NSLocalizedString(LocalizedString.image, comment: LocalizedString.empty))
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
        } else {
            Image(NSLocalizedString(LocalizedString.image, comment: LocalizedString.empty))
                .resizable()
        }
    }
    
    @ViewBuilder
    var searchText: some View {
        VStack{
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
}
