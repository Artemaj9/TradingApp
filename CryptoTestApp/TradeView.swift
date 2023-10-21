//
//  TradeView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI

struct TradeView: View {
    
    @State var pair: String = "GPB/USD"
    @State var selectedId: Int = 3
    @State var investment = 1000
    @State var balance = 10000
    
    var body: some View {
        NavigationStack {
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
                            Text("\(balance)")
                                .fontWeight(.black)
                        }
                        
                        .foregroundColor(.white)
                    }
                    .background(
                        Color("bgmain")
                    )
                    .zIndex(1)
                    WebView()
                    //.scaleEffect(3)
                    // .offset(x: -420, y: -530)
                        .zIndex(0.4)
                    
                        VStack {
                            NavigationLink(destination: CurrencyPairView(text: $pair, selectedId: $selectedId )) {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("graybalance"))
                                   
                                        .frame(height: 63)
                                   Text(pair)
                                        .foregroundColor(.white)
                                    HStack {
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .scaleEffect(1.2)
                                            .foregroundColor(.white)
                                            .offset(x: -20)
                                    }
                                }
                            }
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("graybalance"))
                                    VStack {
                                        Text("Timer")
                                            .font(.body)
                                            .foregroundColor(Color("greytxt"))
                                        HStack {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.leading, 12)
                                            Spacer()
                                            Text("00:01")
                                                .foregroundColor(.white)
                                            Spacer()
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.trailing, 12)
                                        }
                                    }
                                }
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("graybalance"))
                                    VStack {
                                        Text("Investment")
                                            .font(.body)
                                            .foregroundColor(Color("greytxt"))
                                        HStack {
                                            Image(systemName: "minus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.leading, 12)
                                                .onTapGesture {
                                                    if investment > 0 {
                                                        investment -= 100
                                                    }
                                                }
                                            Spacer()
                                            Text("\(investment)")
                                                .foregroundColor(.white)
                                            Spacer()
                                            Image(systemName: "plus.circle")
                                                .foregroundColor(Color("greytxt"))
                                                .padding(.trailing, 12)
                                                .onTapGesture {
                                                    if investment >= 0 && investment <= balance - 100 {
                                                        investment += 100
                                                    }
                                                }
                                        }
                                    }
                                }
                                .padding(.bottom, 8)
                            }
                            .frame(height: 63)
                            HStack {
                                ZStack(alignment: .topLeading) {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("redSell"))
                                    Text("Sell")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .fontWeight(.medium)
                                        .padding([.vertical, .leading])
                                }
                                .onTapGesture {
                                    balance += investment
                                }
                                ZStack(alignment: .topLeading) {
                                    Rectangle()
                                        .cornerRadius(12)
                                        .foregroundColor(Color("btn"))
                                    Text("Buy")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .fontWeight(.medium)
                                        .padding([.vertical, .leading])
                                }
                                .onTapGesture {
                                    balance -= investment
                                }
                            }
                            .frame(height: 53)
                            
                        }
                        .frame(width: .infinity)
                        .padding(36)
                        .background(
                            Color("bgmain")
                        )
                       .offset(y: -90)
                       .zIndex(1)
                       
                    }
                   
                    
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
