//
//  FirstScreenViewModel.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import Foundation
import SwiftUI
import Combine

final class FirstScreenViewModel: ObservableObject {
    @Published var percent = 0
    @Published var showAlert = false
    var cancellables = Set<AnyCancellable>()
    @Published var goTabBar = false
    
    func setUpTimer() {
        Timer
            .publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                let a = min (100, percent + Int([1,2,5,7,9].randomElement()!))
                percent = a
                if percent == 100 {
                    showAlert = true
                    for item in cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
       
}
