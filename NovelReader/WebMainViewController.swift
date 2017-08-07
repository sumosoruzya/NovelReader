//
//  WebMainViewController.swift
//  NovelReader
//
//  Created by 鈴木雄太 on 2017/08/04.
//  Copyright © 2017年 sumo. All rights reserved.
//

import UIKit

class WebMainViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://syosetu.org")!
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
        // Do any additional setup after loading the view.
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
