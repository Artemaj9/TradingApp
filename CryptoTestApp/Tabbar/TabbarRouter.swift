import SwiftUI

class TabbarRouter: ObservableObject {
    @Published var currentPage: Page = .top
}

enum Page {
    case trade
    case top
}
