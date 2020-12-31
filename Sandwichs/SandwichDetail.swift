//
//  SandwichDetail.swift
//  Sandwichs
//
//  Created by ZhangLe on 2020/6/28.
//  Copyright © 2020 zhangle. All rights reserved.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed: Bool = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            
            Image(sandwich.name)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
            
            Spacer(minLength: 0)
            
            if sandwich.isSpicy && !zoomed {
                Text("Spicy")
                    .padding()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(sandwich.name)
        .onTapGesture {
            withAnimation {
                self.zoomed.toggle()
            }
        }
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichDetail(sandwich: testData[0])
        }
    }
}
