//
//  SearchBar.swift
//

import SwiftUI

struct SearchBarView: View {

    // MARK: - Property Wrappers

    @Binding var timeText: String
    @ObservedObject var vm : TradeViewModel

    // MARK: - Internal Properties
    
    let placeholder: String
    let backgroundColor: Color


    var body: some View {
            
            TextField(placeholder, text: $timeText)
                .foregroundColor(.white)
                .disableAutocorrection(true)
                .submitLabel(.return)
                .keyboardType(.numberPad)
                .onSubmit {
                    vm.setUpTimer()
                }
               
                .frame(width: 100, height: 20)
        .font(.headline)
    }
}
