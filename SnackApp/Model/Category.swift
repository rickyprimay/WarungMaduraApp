//
//  Category.swift
//  SnackApp
//
//  Created by Ricky Primayuda Putra on 17/11/24.
//

import SwiftUI

struct Category: Identifiable, Hashable {
    var id: UUID = UUID()
    var icon: String
    var title: String
}

var categoryList: [Category] = [
    Category(icon: "", title: "All"),
    Category(icon: "flame", title: "Rokok"),
    Category(icon: "takeoutbag.and.cup.and.straw", title: "Minuman"),
    Category(icon: "ellipsis", title: "Lainnya")
]
