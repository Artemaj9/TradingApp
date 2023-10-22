//
//  Coordinator.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func show<V>(_ viewType: V.Type) where V: View {
        path.append(String(describing: viewType.self))
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
