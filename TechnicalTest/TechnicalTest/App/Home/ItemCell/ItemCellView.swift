//
//  ListItemView.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import SwiftUI
import TechnicalTestCore
import Kingfisher

struct ItemCellView: View {
    
    private var item: ProductDetail
    
    init(item: ProductDetail) {
        self.item = item
    }
    
    var body: some View {
        HStack(spacing: 0) {
            KFImage(URL(string: self.item.image))
                .cacheOriginalImage()
                .placeholder { progress in
                    ProgressView(progress)
                }
                .forceTransition(true)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack(alignment: .leading) {
                Text(self.item.title)
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.black)
                    .lineSpacing(0)
                    .minimumScaleFactor(0.5)
                
                
                HStack {
                    Text(NumberFormatter.localizedString(from: self.item.price as NSNumber, number: .currency))
                        .font(.system(size: 25))
                        .foregroundColor(Color.black)
                }
                Spacer()
                HStack {
                    Text(self.item.seller_address.state.name)
                        .font(.system(size: 10))
                    Text(self.item.seller_address.country.name)
                        .font(.system(size: 10))
                }
            }.padding()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10
                            )
            .stroke(.gray, lineWidth: 1)
        )
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = ProductDetail(id: "",
                                 site_id: "",
                                 title: "MOTOROLA",
                                 price: 20000,
                                 sold_quantity: 2,
                                 image: "",
                                 attributes: [],
                                 seller_address: SellerAddress(country: Country(id: "", name: ""),
                                                               city: City(id: "", name: ""),
                                                               state: States(id: "", name: "")))
        ItemCellView(item: item)
    }
}
