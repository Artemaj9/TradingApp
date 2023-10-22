//
//  TopTraidersViewModel.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import SwiftUI
import Combine

class TopTraidersViewModel: ObservableObject {
    
    
    @Published var count = 0
    var cancellables = Set<AnyCancellable>()
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                count += 1
                if count % 5 == 0 {
                    var indexes = [Int]()
                    let n = Int.random(in: 1...10)
                    for i in 0...n-1 {
                        indexes.append(Int.random(in: 0...9))
                    }
                    let set = Set(indexes)
                    for index in set {
                        mocData[index].deposit += Int.random(in: 50...150)
                        mocData[index].profit += Int.random(in: 50...150)
                    }
                    // mocData.randomElement()!.profit += Int.random(in: 50...150)
                }
            }
            .store(in: &cancellables)
    }
}
