//
//  ContentView.swift
//  Sandwichs
//
//  Created by ZhangLe on 2020/6/28.
//  Copyright © 2020 zhangle. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform: moveSandwich)
                .onDelete(perform: removeSandwich)
                
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwichs")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationBarTitle("Sandwichs")
            .navigationBarItems(leading: Button("Add", action: makeSandwich),
                                trailing: EditButton())
        
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "1", ingredientCount: 4))
        }
    }
    
    func moveSandwich(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func removeSandwich(fromOffset: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: fromOffset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            Image(sandwich.name)
                .resizable()
                .cornerRadius(8)
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 44, height: 44, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
