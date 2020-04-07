//
//  WebViewController.swift
//  Students
//
//  Created by 1 on 06.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
   
    var webView: WKWebView!
    var website = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: website)!
        webView.load(URLRequest(url:url))
    }
    
//    @objc func backTapped(){
//        self.dismiss(animated: true, completion: nil)
//    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        title = webView.title
//    }

}
