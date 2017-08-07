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
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coverView.alpha = 0.0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WebViewController.didTapCover(_:)))
        coverView.addGestureRecognizer(tapGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showSideMenu() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.size.width += 230.0
            self.coverView.alpha += 0.5
        }, completion: nil)
        self.sideView.frame.size.width = 230.0
        self.coverView.alpha = 0.5
        self.coverView.isUserInteractionEnabled = true
    }
    
    func hideSideMenu() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.size.width -= 230.0
            self.coverView.alpha -= 0.5
        }, completion: nil)
        self.sideView.frame.size.width = 0.0
        self.coverView.alpha = 0.0
        self.coverView.isUserInteractionEnabled = false
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        if (self.sideView.frame.size.width < 230.0) { self.showSideMenu() }
        else if (self.sideView.frame.size.width > 0.0) { self.hideSideMenu() }
    }
    
    @IBAction func didTapCover(_ sender: UIBarButtonItem) {
        if (self.sideView.frame.size.width > 0.0) { self.hideSideMenu() }
    }
}
