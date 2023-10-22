//
//  TradeViewModel.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import SwiftUI
import Combine

class TradeViewModel: ObservableObject {
    
    @Published var seconds: Int = 0
    @Published var timeText = "00:12"
    @Published var timerFlag = false
    @Published var showAlert = false
    
    var cancellables = Set<AnyCancellable>()
    
    
    func textToSeconds(text: String) -> Int {
        let arr = Array(text)
        var answ = 0
        if text.count == 5 {
            if let a = Int(String(arr[4])),
               let b = Int(String(arr[3])),
               let c = Int(String(arr[1])),
               let d = Int(String(arr[0])) {
                
                answ = a + 10 * b + 60 * c + 600 * d
            }
            
        } else {
            for item in cancellables {
                item.cancel()
            }
        }
        return answ
    }
    
    func secondsToText(seconds: Int) -> String {
        var arr = Array(repeating: "", count: 5)
        arr[0] = String(seconds / 600)
        arr[1] = String((seconds % 600) / 60)
        arr[2] = ":"
        arr[3] = String((seconds % 600) % 60 / 10)
        arr[4] = String((seconds % 600) % 60 % 10)
        return arr.joined()
    }
    
    func changetime(x: Int) -> String {
        return secondsToText(seconds: (textToSeconds(text: timeText) + x))
    }
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                if timeText == "00:00" {
                    timerFlag = true
                }
                if timerFlag || timeText.count != 5 {
                    for item in cancellables {
                        item.cancel()
                    }
                } else {
                    seconds += 1
                    timeText = changetime(x: -1)
                }
            }
            .store(in: &cancellables)
    }
}
