//
//  TradeView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI

struct TradeView: View {
    var body: some View {
        ZStack {
            Color("bgmain")
                .ignoresSafeArea()
            VStack {
                Text("Trade")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                ZStack {
                    
                    Rectangle()
                        .cornerRadius(12)
                        .foregroundColor(Color("graybalance"))
                        .frame(width: .infinity, height: 63)
                        .padding(.horizontal, 36)
                        .padding(.top, 12)
                        .padding(.bottom, 8)
                      
                    
                    VStack {
                        Text("Balance")
                            .font(.caption)
                            .padding(.bottom, 3)
                        Text("10000")
                            .fontWeight(.black)
                    }
                 
                    .foregroundColor(.white)
                }
                .background(
                    Color("bgmain")
            )
                .zIndex(1)
                WebView()
                    .scaleEffect(3)
                    .offset(x: -420, y: -530)
                    .zIndex(0.4)
                VStack {
                    Rectangle()
                        .cornerRadius(12)
                        .foregroundColor(Color("graybalance"))
                        .frame(width: .infinity, height: 63)
                        .padding(36)
                }
                .background(
                    Color("bgmain")
                )
                .offset(y: -90)
                .zIndex(1)
                
                
                //.ignoresSafeArea()
                // .background(
                //Color("bgmain");)
                
                
            }
        }
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
