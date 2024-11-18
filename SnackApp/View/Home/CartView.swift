//
//  Cart.swift
//  SnackApp
//
//  Created by Ricky Primayuda Putra on 18/11/24.
//

import SwiftUI

struct CartView: View {
   
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Keranjang")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Text("\(cartManager.products.count)")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .background(.yellow.opacity(0.5))
                                .clipShape(Capsule())
                        }
                        .foregroundStyle(.black)
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(30)
                    
                    VStack(spacing: 20){
                        ForEach(cartManager.products, id: \.name) { item in
                            CartProductCardView(product: item)
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Pajak Belanja kamu")
                            Spacer()
                            Text("Rp. 0")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        
                        Divider()
                        
                        Text("Total Belanja")
                            .font(.system(size: 24))
                        
                        Text("Rp. \(cartManager.total)")
                            .font(.system(size: 30, weight: .semibold))
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(.yellow.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 30))
                    .padding()
                    
                    Button{
                        
                    } label: {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(.yellow.opacity(0.5))
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}


struct CartProductCardView: View {
    var product: Product
    var body: some View{
        HStack(alignment: .center, spacing: 20){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(.gray.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(product.name)
                    .font(.headline)
                    
                Text(product.category)
                    .font(.callout)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Text("Rp. \(product.price)")
                .padding()
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
        }
    }
    
}
