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
                        TabItem(width: geometry.size.width / 2, height: geometry.size.height / 40, iconName: "bolt.horizontal.fill" ,text: "Trade", tabbarRouter: tabbarRouter, assignedPage: .trade)
                        TabItem(width: geometry.size.width / 2, height: geometry.size.height / 40, iconName: "person.fill", text: "Top", tabbarRouter: tabbarRouter, assignedPage: .top)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(Color("tabBarBackground2"))
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
