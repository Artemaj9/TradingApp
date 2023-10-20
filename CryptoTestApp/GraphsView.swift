//
//  GraphsView.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    //let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
       // webView.layer.backgroundColor = Color("bgmain").cgColor
       // webView.opaque = NO
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        webView.loadHTMLString(Source.htmlString, baseURL: nil)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // This space can be left blank
    }
}

