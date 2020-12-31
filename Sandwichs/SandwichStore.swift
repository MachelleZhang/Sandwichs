//
//  SandwichStore.swift
//  Sandwichs
//
//  Created by ZhangLe on 2020/6/28.
//  Copyright © 2020 zhangle. All rights reserved.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
