//
//  Sandwich.swift
//  Sandwichs
//
//  Created by ZhangLe on 2020/6/28.
//  Copyright © 2020 zhangle. All rights reserved.
//

import Foundation

struct Sandwich: Identifiable {
    var id = UUID()
    var name: String
    var ingredientCount: Int
    var isSpicy: Bool = false
}

let testData = [
    Sandwich(name: "1", ingredientCount: 3, isSpicy: true),
    Sandwich(name: "2", ingredientCount: 3),
    Sandwich(name: "3", ingredientCount: 3),
    Sandwich(name: "4", ingredientCount: 3),
    Sandwich(name: "5", ingredientCount: 3),
    Sandwich(name: "6", ingredientCount: 3)
]
