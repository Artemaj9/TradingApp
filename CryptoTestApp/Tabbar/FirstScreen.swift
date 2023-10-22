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
    var cancellables = Set<AnyCancellable>()
    var body: some View {
        ZStack {
            BackgroundView()
            LoaderView(percent: $vm.percent)
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
                            showAlert.toggle()
                        }
                    },
                    cancelActionTitle: "Don't Allow",
                    primaryAction: {
                      // Primary action here
                        withAnimation {
                            showAlert.toggle()
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
