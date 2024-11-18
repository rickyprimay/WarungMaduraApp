//
//  Product.swift
//  SnackApp
//
//  Created by Ricky Primayuda Putra on 17/11/24.
//

import SwiftUI

struct Product: Identifiable {
    var id: UUID = UUID()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

var productList = [
    Product(name: "Surya 16", category: "Rokok", image: "surya16", color: .yellow, price: 35000),
    Product(name: "Surya 12", category: "Rokok", image: "surya12", color: .red, price: 25000),
    Product(name: "Sampoerna Mild 16", category: "Rokok", image: "sampoerna16", color: .orange, price: 35000),
    Product(name: "Sampoerna Mild 12", category: "Rokok", image: "sampoerna12", color: .purple, price: 25000),
    Product(name: "Teh Pucuk Harum 300 ML", category: "Minuman", image: "tehpucuk", color: .pink, price: 5000),
    Product(name: "Aqua 600 ML", category: "Minuman", image: "aqua", color: .blue, price: 4000),
    Product(name: "Sunlight Kecil", category: "Lainnya", image: "sunlight", color: .indigo, price: 3000),
    Product(name: "Mainan Anak", category: "Lainnya", image: "mainan", color: .green, price: 23000),
]
