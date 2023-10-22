//
//  WebViev2.swift
//  CryptoTestApp
//
//  Created by Artem on 23.10.2023.
//

import SwiftUI
import WebKit
import Combine

struct WebView2: UIViewRepresentable {
    
    //let url: URL
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
       
       // webView.layer.backgroundColor = Color("bgmain").cgColor
       // webView.opaque = NO
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        webView.loadHTMLString(Source.htmlString2, baseURL: nil)
             
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        }
}

