//
//  FirstScreen.swift
//  CryptoTestApp
//
//  Created by Artem on 22.10.2023.
//

import SwiftUI
import Combine


struct FirstScreen: View {
    @StateObject var vm = FirstScreenViewModel()
    @State private var path = NavigationPath()
    var cancellables = Set<AnyCancellable>()
    var body: some View {
            ZStack {
                Tabbar()
                    .opacity(vm.goTabBar ? 1 : 0)
                BackgroundView()
                    .opacity(vm.goTabBar ? 0 : 1)
                LoaderView(percent: $vm.percent)
                    .opacity(vm.goTabBar ? 0 : 1)
                    .padding(.horizontal, 36)
                    .opacity(vm.percent == 100 ? 0 : 1 )
                    .animation(.easeOut, value: vm.percent)
                if vm.showAlert {
                    CustomAlertView(
                        title: """
\"App\" would like to Send You
 Notifications
""",
                        description:
"""
Notifications may include alerts,
sounds and icon badges. This can be
cofigured in Settings.
"""
                        ,
                        cancelAction: {
                            // Cancel action here
                            withAnimation {
                                vm.showAlert.toggle()
                            }
                        },
                        cancelActionTitle: "Don't Allow",
                        primaryAction: {
                            // Primary action here
                            vm.goTabBar = true
                            withAnimation {
                                vm.showAlert.toggle()
                            }
                        },
                        primaryActionTitle: "Allow"
                    )
                }
            }
            .onAppear {
                vm.setUpTimer()
            }
    }
    

}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
