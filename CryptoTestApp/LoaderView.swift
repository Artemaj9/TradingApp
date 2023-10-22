//
//  LoaderView.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI


struct LoaderView: View {
    @State var showAlert = false
    @State var percent: Int
    
    var body: some View {
        StarView.overlay(OverlayView.mask(StarView)).overlay(PercentView)
        }
    
    private var StarView: some View {
        Rectangle()
            .cornerRadius(30)
            .foregroundColor(Color("loaderback"))
            .frame(height: 24)
    }
    private var OverlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
               Rectangle()
                    .foregroundColor(Color("btn"))
                    .cornerRadius(30)
                    .frame(width: CGFloat(percent)/100 * geometry.size.width)
            }
        }
    }
    private var PercentView: some View {
        Text("\(percent) %")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(percent: 100)
    }
}

