//
//  BalanceBar.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import SwiftUI

struct BalanceBarView: View {

    // MARK: - Property Wrappers

    @Binding var timeText: Int

    // MARK: - Internal Properties
    
    let placeholder: String
    let backgroundColor: Color


    var body: some View {
            
            TextField(placeholder, value: $timeText, formatter: NumberFormatter())
            .font(Font.custom("Inter-Bold", size: 17))
            .foregroundColor(.white)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .submitLabel(.return)
                .keyboardType(.numberPad)
                .onSubmit {
                    
                }
                .frame(width: 100, height: 20)
        .font(.headline)
    }
}

