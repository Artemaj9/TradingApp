//
//  BackgroundView.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color("bgmain").ignoresSafeArea()
            
            RadialGradient(colors: [Color("btn").opacity(0.3), Color("bgmain").opacity(0)], center: .center, startRadius: 50, endRadius: 200)
                .scaleEffect(1)
                .offset(x: 120, y: -140)
                .blur(radius: 70)
            
            RadialGradient(colors: [Color("red").opacity(0.3), Color("bgmain").opacity(0)], center: .center, startRadius: 50, endRadius: 200)
                .scaleEffect(1)
                .offset(x: -120, y: 100)
                .blur(radius: 70)
           // LoaderView(percent: 78)
              //  .padding(.horizontal, 36)
        }
        .drawingGroup()
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
