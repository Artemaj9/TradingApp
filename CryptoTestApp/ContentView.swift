//
//  ContentView.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Color("bgmain")
                .ignoresSafeArea()
            Button("Show alert") {
                withAnimation {
                    showAlert.toggle()
                }
            }
            if showAlert {
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
                    material: .ultraThick,
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
