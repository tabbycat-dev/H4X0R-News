//
//  WebView.swift
//  H4X0R News
//
//  Created by Tan Nguyen on 8/6/20.
//  Copyright © 2020 Tan Nguyen. All rights reserved.
//

//THis could be reusable for future project
//this should be Swift file instead of SwiftUi
import Foundation
import WebKit
import SwiftUI // neccessary to know about Context / UIViewRepresentable

//need to use webView
//import WebKit, conform protocol : UiViewRePpresentable
struct WebView : UIViewRepresentable {
    
    let urlString : String?
    
     //WKWebView = WebView.UIViewType
    //Context = UIViewRepresentableContext<WebView>
    func makeUIView(context: Context) ->  WKWebView{
            return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView , context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }else{
                print("No Link")
            }
        }
    }
    
}

//Bug Alert! List Only Shows 1 Line and Truncates Text
//At the time of writing (17th September 2019), it seems like there's a bug in SwiftUI that truncates the Text in a List to a single line if the app is being rendered on anything other than the iPhone X devices (i.e. iPhone X/Xs/XR/11/11 Pro). See screenshots below. We've submitted a bug report to Apple and will see what they say. Hopefully, they'll fix it soon!
