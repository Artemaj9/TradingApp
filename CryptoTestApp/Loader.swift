//
//  Loader.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct Loader: View {
    @Binding var percent: Int
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color("loaderback"))
                .frame(height: 24)
                .padding(.horizontal, 36)
            Text("\(percent)%")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader(percent: .constant(23))
    }
}
