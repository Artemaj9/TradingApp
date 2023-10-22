//
//  GraphsView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI
import WebKit
import Combine

struct WebView: UIViewRepresentable {
    //let url: URL
    let shouldRefresh: CurrentValueSubject<Bool, Never>

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
       
        
       // webView.layer.backgroundColor = Color("bgmain").cgColor
       // webView.opaque = NO
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        webView.loadHTMLString(Source.htmlString, baseURL: nil)
        context.coordinator.navigation = webView.loadHTMLString(Source.htmlString, baseURL: nil)
             context.coordinator.webView = webView
             context.coordinator.observeChanges(for: shouldRefresh)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // This space can be left blank
    }

func makeCoordinator() -> Coordinator {
       Coordinator()
   }
}

extension WebView {
   
   class Coordinator {
       var navigation: WKNavigation?
       var webView: WKWebView?
       private var cancellable: AnyCancellable?
       
       @MainActor
       func observeChanges(for shouldRefresh: CurrentValueSubject<Bool, Never>) {
           cancellable = shouldRefresh
               .filter { $0 == true }
               .sink { [unowned self] newValue in
                webView!.loadHTMLString(Source.htmlString, baseURL: nil)
               }
       }
   }
}
