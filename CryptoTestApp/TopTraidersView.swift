//
//  TopTraidersView.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct TopTraidersView: View {
    @StateObject var vm = TopTraidersViewModel()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("bgmain")
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("TOP 10 Traders")
                        .font(Font.custom("Inter-Bold", size: 27))
                        .padding(.top, 20)
                        .padding(.bottom, 28)
                        .foregroundColor(.white)
                    
                        HStack() {
                            Text("№")
                                .font(Font.custom("Inter-Medium", size: 12))
                                .frame(
                                    width: geometry.size.width * 0.05, alignment: .leading
                                )
                                .offset(x: -4)
                            Spacer()
                            Text("Country")
                                .font(Font.custom("Inter-Medium", size: 12))
                                .frame(
                                    width: geometry.size.width * 0.17, alignment: .center
                                )
                            Text("Name")
                                .font(Font.custom("Inter-Medium", size: 12))
                                .frame(
                                    width: geometry.size.width * 0.15, alignment: .center
                                )
                            Text("Deposit")
                                .font(Font.custom("Inter-Medium", size: 12))
                                .frame(
                                    width: geometry.size.width * 0.2, alignment: .trailing
                                )
                                .offset(x: -8)
                            Text("Profit")
                                .font(Font.custom("Inter-Medium", size: 12))
                                .frame(
                                    width: geometry.size.width * 0.2, alignment: .trailing
                                )
                                .offset(x: -12)
                        }
                        .foregroundColor(Color("ratingheader"))
                        .padding()
                        .background(
                            Color("lightcell"))
                        .cornerRadius(9, corners: [.topLeft, .topRight])
                        .padding(.horizontal, 12)
                    ForEach(mocData.indices) { index in
                        HStack {
                            Text(String(mocData[index].position))
                                .font(Font.custom("Inter-Medium", size: 14))
                                .foregroundColor(Color("ratingheader"))
                                .frame(
                                    width: geometry.size.width * 0.05, alignment: .leading
                                )
                            Image(mocData[index].country)
                                .scaleEffect(1.5)
                                .frame(
                                    width: geometry.size.width * 0.18, alignment: .center
                                )
                            Text(mocData[index].name)
                                .font(Font.custom("Inter-Medium", size: 14))
                                .foregroundColor(.white)
                                .frame(
                                    width: geometry.size.width * 0.15, alignment: .center                               )
                            Text("$\(mocData[index].deposit)")
                                .font(Font.custom("Inter-Medium", size: 14))
                                .foregroundColor(.white)
                                .frame(
                                    width: geometry.size.width * 0.2, alignment: .center
                                )
                            Text("$\(mocData[index].profit)")
                                .font(Font.custom("Inter-Medium", size: 14))
                                .foregroundColor(Color("btn"))
                                .frame(
                                    width: geometry.size.width * 0.2, alignment: .trailing
                                )
                        }
                        .animation(.easeIn, value: mocData[index].deposit)
                        .animation(.easeInOut, value: mocData[index].profit)
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background(index % 2 == 0 ? Color("darkcell") : Color("lightcell"))
                        .cornerRadius(index == 9 ? 9 : 0, corners: [.bottomLeft, .bottomRight])
                        .padding(.horizontal, 12)
                        
                       
                    }
                    Spacer()
                }
            }
            .onAppear {
                vm.setUpTimer()
            }
        }
    }
//
//        private var columnTitles: some View {
//            HStack {
//                HStack(spacing: 4) {
//                    Text("№")
//                    Spacer()
//                    Text("Country")
//                    Spacer()
//                    Text("Name")
//                    Spacer()
//                    Text("Deposit")
//                    Spacer()
//                    Text("Profit")
//                }
//                .foregroundColor(Color("ratingheader"))
//                .padding()
//            }
//        }
    }

struct TopTraidersView_Previews: PreviewProvider {
    static var previews: some View {
        TopTraidersView()
    }
}
