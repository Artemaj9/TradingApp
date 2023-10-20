//
//  TopTraidersView.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct TopTraidersView: View {
    var body: some View {
        ZStack {
            Color("bgmain")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("TOP 10 Traders")
                    .fontWeight(.bold)
                    .padding(.top, 36)
                    .padding(.bottom, 42)
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                  
                columnTitles
                    .background(
                       // UnevenRoundedRectangle(
                        Color("lightcell"))
                    .padding(.horizontal, 12)
                ForEach(mocData.indices) { index in
                    HStack {
                        Text(String(mocData[index].position))
                            .foregroundColor(Color("ratingheader"))
                        Spacer()
                        Image(mocData[index].country)
                        Spacer()
                        Text(mocData[index].name)
                            .foregroundColor(.white)
                        Spacer()
                        Text("$\(mocData[index].deposit)")
                            .foregroundColor(.white)
                        Spacer()
                        Text("$\(mocData[index].profit)")
                            .foregroundColor(Color("btn"))
                    }
                    .padding()
                    .background(index % 2 == 0 ? Color("darkcell") : Color("lightcell"))
                    .padding(.horizontal, 12)
                }
                Spacer()
            }
        }
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("№")
                Spacer()
                Text("Country")
                Spacer()
                Text("Name")
                Spacer()
                Text("Deposit")
                Spacer()
                Text("Profit")
            }
            .foregroundColor(Color("ratingheader"))
            .padding()
        }
    }
}

struct TopTraidersView_Previews: PreviewProvider {
    static var previews: some View {
        TopTraidersView()
    }
}
