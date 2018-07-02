//
//  YoutubeViewController.swift
//  testOpenLink
//
//  Created by Sky Xu on 4/4/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit
import WebKit

protocol OpenedViewDelegate: class {
    func changeXis()
}

class YoutubeViewController: UIViewController, WKUIDelegate {

    weak var openedViewdelegate: OpenedViewDelegate?
    
    var webView: WKWebView!
    var btn: UIButton!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        let frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        btn = UIButton(frame: frame)
        btn.backgroundColor = UIColor.red
        view.addSubview(btn)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
//        let myURL = URL(string: "https://www.youtube.com/watch?v=Y7ojcTR78qE&spfreload=9")
        let myURL = URL(string: "https://medium.com/@ales.musto/making-a-share-extension-that-accepts-text-and-urls-in-combination-with-coredata-swift-3-a0139c0f9800")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        btn.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
    }
    
    @objc func backTapped() {
        if(webView.canGoBack) {
            //Go back in webview history
            webView.goBack()
        } else {
            //Pop view controller to preview view controller
            self.openedViewdelegate?.changeXis()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
