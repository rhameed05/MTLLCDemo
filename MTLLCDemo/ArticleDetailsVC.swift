//
//  ArticleDetailsVC.swift
//  MTLLCDemo
//
//  Created by Mac on 31/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit
class ArticleDetailsVC: UIViewController, WKUIDelegate {
    var articleUrl = String()
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    let forwardBarItem = UIBarButtonItem(title: "Forward", style: .plain, target: self,
                                         action: #selector(forwardAction))
    let backBarItem = UIBarButtonItem(title: "Backward", style: .plain, target: self,
                                      action: #selector(backAction))
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //setupNavItem()
        let myURL = URL(string: self.articleUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    @objc func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
        
    @objc func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    func setupNavItem() {
        self.navigationItem.leftBarButtonItem = backBarItem
        self.navigationItem.rightBarButtonItem = forwardBarItem
    }
        
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
