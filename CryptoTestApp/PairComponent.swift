//
//  PairComponent.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI

struct PairButton: View {
    
    let hSize: CGFloat
    let vSize: CGFloat
    let text: String
    let id: Int
    @Binding var selectedId: Bool

    
    var body: some View {
        ZStack {
            Text("EUR/USD")
                .foregroundColor(.white)
                .padding()
        }
        .frame(width: hSize, height: vSize)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(selectedId ? Color("btn") : Color("bgpair"))
            )
    }
}

struct PairButton_Previews: PreviewProvider {
    static var previews: some View {
        PairButton(hSize: 140, vSize: 54, text: "RUB/USD", id: 0, selectedId: .constant(true))
    }
}
