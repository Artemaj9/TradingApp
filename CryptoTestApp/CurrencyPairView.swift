//
//  CurrencyPairView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI

struct CurrencyPairView: View {
    
    @Binding var text: String
    @Environment(\.dismiss) private var dismiss
    let padding: CGFloat = 16
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -8, alignment: nil),
        GridItem(.flexible(), spacing: -8, alignment: nil)
    ]
    @Binding var selectedId: Int
    @ObservedObject var vm: TradeViewModel
    var body: some View {
        ZStack {
            Color("bgmain")
                .ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    LazyVGrid(
                        columns: columns,
                        alignment: .center,
                        spacing: 0
                    ) {
                        ForEach(currencyPairs) { pair in
                            
                            ZStack {
                                Text(pair.pair)
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 150, height: 64)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(selectedId == pair.id ? Color("btn") : Color("bgpair"))
                            )
                            .animation(.easeIn(duration: 0.2), value: selectedId)
                            .onTapGesture {
                                selectedId = pair.id
                               // text = pair.pair
                                vm.pair = pair.pair
                                
                            }
                            .padding(.vertical, 12)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 48)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Currency pair")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                ZStack {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                }
                .offset(y: 10)
            }
            ToolbarItem(placement: .principal) {
                Text("Currency pair")
                    .font(Font.custom("Inter-Bold", size: 22))
                    .foregroundColor(.white)
                    .offset(y: 12)
            }
        }
    }
}

//struct CurrencyPairView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrencyPairView(text: .constant("1"), selectedId: .constant(3))
//    }
//}
