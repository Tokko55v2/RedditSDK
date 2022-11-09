//
//  ContentView.swift
//  RedditTestHost
//
//  Created by Michael on 09.11.22.
//

import Foundation
import SwiftUI
import WebKit
import Combine
import RedditSDK

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        Text("Hallo World")
            .sheet(isPresented: .constant((viewModel.url != nil))) {
                WebView(url: viewModel.url!) { url in
                    viewModel.response(url: url)
                }
            }
    }
}

class ContentViewModel: ObservableObject {
    @Published var url: URL?
    var store: [AnyCancellable] = []
    let module: RedditModule
    
    init() {
        guard let clientId = ProcessInfo.processInfo.environment["CLIENT_ID"] else {
            fatalError("no client id found")
        }
        
        module = RedditModuleBuilder(
            configuration: RedditConfiguration(
                clientId: clientId,
                scopes: { ["identity"] }
            )
        ).build()
        
        module.login()
            .sink(receiveCompletion: { _ in
            }, receiveValue: {
                self.url = $0
            })
            .store(in: &store)
    }
    
    func response(url: URL) {
        module.handleLoginResponse(url: url)
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { _ in })
            .store(in: &store)
    }
    
}

struct WebView: UIViewRepresentable {
    var response: (URL) -> Void
    var url: URL
    
    init(url: URL, response: @escaping (URL) -> Void) {
        self.url = url
        self.response = response
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.add(userScript:context.coordinator.userScript)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, respsonse: response)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var response: (URL) -> Void
        
        lazy var userScript: String = {
            guard let username = ProcessInfo.processInfo.environment["USERNAME"],
                  let password = ProcessInfo.processInfo.environment["PASSWORD"] else {
                fatalError("no client id found")
            }
            
            return """
document.getElementById("loginUsername").value = "\(username)"
document.getElementById("loginPassword").value = "\(password)"

var secondDelayInMillisesconds = 1000;
setTimeout(function() {
window.scrollTo(0, document.body.scrollHeight);
document.getElementsByTagName("button")[0].click()
}, secondDelayInMillisesconds);
"""
        }()
        
        init(_ parent: WebView, respsonse: @escaping (URL) -> Void) {
            self.parent = parent
            self.response = respsonse
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let redirectedUrl = navigationAction.request.url,
               let urlComponents = URLComponents(url: redirectedUrl, resolvingAgainstBaseURL: true),
               let queryItems = urlComponents.queryItems {
                if queryItems.contains(where: { $0.name == "code" }) {
                    response(redirectedUrl)
                    return decisionHandler(.allow)
                }
            }
            decisionHandler(.allow)
        }
    }
}


private extension WKWebView {
    func add(userScript: String) {
        let userScript = WKUserScript(
            source: userScript, injectionTime: .atDocumentEnd, forMainFrameOnly: false
        )
        
        self
            .configuration
            .userContentController
            .addUserScript(userScript)
    }
}
