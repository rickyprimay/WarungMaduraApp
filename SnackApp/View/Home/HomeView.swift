//
//  HomeView.swift
//  SnackApp
//
//  Created by Ricky Primayuda Putra on 17/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedCategory: String = "All"
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Pesan dari Pilihan Terbaik anda di **Warung Bungkok**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    
                    CategoryListView
                    
                    HStack {
                        Text("Rokok **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundStyle(.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { product in
                                ProductCardView(item: product)
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
        }
    }
    
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(systemName: item.icon)
                                        .foregroundStyle(selectedCategory == item.title ? .yellow : .black)
                                }
                                
                                Text(item.title)
                                    
                            }
                            .padding()
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundStyle(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

struct ProductCardView: View {
    
    var item: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(item.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading) {
                    Text("\(item.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(item.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("Rp. \(item.price)")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: item)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundStyle(.white)
                        }
                        .padding(.horizontal, -15)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                }
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .padding(30)
        .frame(width: 336, height: 422)
        .background(item.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}

#Preview {
    HomeView()
        .environmentObject(CartManager())
}
