//
//  CollectionView.swift
//  SnackApp
//
//  Created by Ricky Primayuda Putra on 17/11/24.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Pesan dari Pilihan Terbaik anda di **Warung Bungkok**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 50, height: 50)
                                .background(Circle().stroke().opacity(0.4))
                        }
                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCollectionCardView(item: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ProductCollectionCardView: View {
    
    var item: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -100)
                .rotationEffect(Angle(degrees: 20))
            
            VStack(alignment: .leading) {
                Text("\(item.name)")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(width: 110)

                Text(item.category)
                    .font(.callout)
                    .padding(8)
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Text("Rp. \(item.price)")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(product: item)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .padding(8)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundStyle(.white)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.white.opacity(0.8))
                .clipShape(Capsule())
            }
            .padding(15)
            .frame(width: 180, height: 250)
        }
        .background(item.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 25))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}


#Preview {
    CollectionView()
        .environmentObject(CartManager())
}
