//
//  NotificationTest.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import SwiftUI

struct NotificationTest: View {
    @State var showingAlert = false
    var body: some View {
        ZStack {
            Color("bgmain")
            VStack {
                Button("Show Alert") {
                    showingAlert = true
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("\"APP\" would like to Send You Notifications"),
                        message: Text("Notifications may include alerts, sounds and icon badges. This can be cofigured in Settings."),
                        primaryButton: .default(Text("Allow")) {
                            print("Allow...")
                        },
                        secondaryButton: .default(Text("Don't Allow"))
                    )
                }
            }
        }
    }
}


struct NotificationTest_Previews: PreviewProvider {
    static var previews: some View {
        NotificationTest(showingAlert: true)
    }
}
