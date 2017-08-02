//
//  WebViewController.swift
//  NovelReader
//
//  Created by 鈴木雄太 on 2017/08/03.
//  Copyright © 2017年 sumo. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLを指定
        let url: URL = URL(string: "https://www.apple.com/iphone/")!
        let request: URLRequest = URLRequest(url: url)
        
        // リクエストを投げる
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
