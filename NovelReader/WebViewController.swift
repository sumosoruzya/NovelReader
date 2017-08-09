//
//  WebViewController.swift
//  NovelReader
//
//  Created by 鈴木雄太 on 2017/08/03.
//  Copyright © 2017年 sumo. All rights reserved.
//

import UIKit


class WebViewController: UIViewController {
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var coverView: UIView!
    
    var mainVC: WebMainViewController!
    var sideVC: WebSideMenuTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideView.frame.origin.x = self.view.frame.origin.x + self.view.frame.size.width
        
        for i in self.childViewControllers {
            switch i {
            case is WebMainViewController:
                mainVC = i as! WebMainViewController
            case is WebSideMenuTableViewController:
                sideVC = i as! WebSideMenuTableViewController
            default:
                break
            }
        }
        
        self.coverView.alpha = 0.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showSideMenu() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.origin.x = self.view.frame.origin.x + self.view.frame.size.width - 230.0
            self.coverView.alpha = 0.5
        }, completion: nil)
        self.coverView.isUserInteractionEnabled = true
    }
    
    func hideSideMenu() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.origin.x = self.view.frame.origin.x + self.view.frame.size.width
            self.coverView.alpha = 0.0
        }, completion: nil)
        self.coverView.isUserInteractionEnabled = false
    }
    
    func novelDownload(){
        let nd = NovelDownloader()
        nd.download(mainVC.webView.url!)
    }
    
    @IBAction func didTapMenu(_ sender: Any) {
        if (self.coverView.isUserInteractionEnabled) { self.hideSideMenu() }
        else { self.showSideMenu() }
    }
    
    @IBAction func didTapGoBack(_ sender: UIBarButtonItem) {
        self.mainVC.webView.goBack()
    }
    
    @IBAction func didTapGoForward(_ sender: UIBarButtonItem) {
        self.mainVC.webView.goForward()
    }
}
