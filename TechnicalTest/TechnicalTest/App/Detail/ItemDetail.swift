//
//  ItemDetail.swift
//  TechnicalTest
//
//  Created by leonard Borrego on 16/07/22.
//

import SwiftUI
import TechnicalTestCore
import Kingfisher

struct ItemDetail: View {
    
    var item: ProductDetail
    
    var body: some View {
        VStack(alignment: .center){
            
            Text(self.item.title)
                .fontWeight(.bold)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color.black)
            HStack{
                KFImage(URL(string: self.item.image))
                    .cacheOriginalImage()
                    .placeholder { progress in
                        ProgressView(progress)
                    }
                    .forceTransition(true)
                VStack(alignment: .center) {
                    
                    HStack {
                        Text(NumberFormatter.localizedString(from: self.item.price as NSNumber, number: .currency))
                            .font(.system(size: 25))
                            .foregroundColor(Color.black)
                    }
                    HStack {
                        Text(self.item.seller_address.city.name)
                        Text("-")
                        Text(self.item.seller_address.state.name)
                        Text(self.item.seller_address.country.name)
                    }
                }
            }
            
            Text("Lo que debes saber de este producto: ")
            ForEach(self.item.attributes, id: \.name) { attribute in
                HStack{
                    Text(attribute.name + ":")
                        .fontWeight(.bold)
                    Text(attribute.value_name ?? "")
                }
            }
        }.padding()
            .blueNavigation
            .navigationTitle(Text("Product Detail"))
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: ProductDetail(id: "",
                                       site_id: "",
                                       title: "",
                                       price: 9000,
                                       sold_quantity: 0,
                                       image: "",
                                       attributes: [],
                                       seller_address: SellerAddress(country: Country(id: "", name: ""), city: City(id: "", name: ""), state: States(id: "", name: ""))))
    }
}