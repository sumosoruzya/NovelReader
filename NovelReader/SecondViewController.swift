//
//  SecondViewController.swift
//  NovelReader
//
//  Created by 鈴木雄太 on 2017/08/02.
//  Copyright © 2017年 sumo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLを指定
        let url: URL = URL(string: "https://www.apple.com/iphone/")!
        let request: URLRequest = URLRequest(url: url)
        
        // リクエストを投げる
        webView.loadRequest(request)
    }
    
    
    // ロード時にインジケータをまわす
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("indicator on")
    }
    
    // ロード完了でインジケータ非表示
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("indicator off")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

