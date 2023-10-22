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
                .keyboardType(.numberPad)
                .onSubmit {
                    hideKeyboard()
                    vm.timerFlag = false
                    vm.setUpTimer()
                }
                .submitLabel(.done)
               
                .frame(width: 100, height: 20)
        .font(.headline)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
