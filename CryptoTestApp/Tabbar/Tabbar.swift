import SwiftUI

struct Tabbar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @State private var inputImage: UIImage?
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .trade:
            BackgroundView()
                .environmentObject(tabbarRouter)
        case .top:
            TopTraidersView()
                .environmentObject(tabbarRouter)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                contentView
                VStack {
                    Spacer()
                    HStack {
                        TabItem(width: geometry.size.width / 2, height: geometry.size.height / 18, iconName: "home", tabbarRouter: tabbarRouter, assignedPage: .trade)
                        TabItem(width: geometry.size.width / 2, height: geometry.size.height / 18, iconName: "save", tabbarRouter: tabbarRouter, assignedPage: .top)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
