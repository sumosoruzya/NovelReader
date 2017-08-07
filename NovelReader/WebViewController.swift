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
    
    var isBackgroundVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showBackground() {
        if (self.isBackgroundVisible) { return }
        self.isBackgroundVisible = true
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.size.width += 240.0
        }, completion: nil)
    }
    
    func hideBackground() {
        if (!self.isBackgroundVisible) { return }
        self.isBackgroundVisible = false
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.size.width -= 240.0
        }, completion: nil)
    }
    
    @IBAction func didEdgeSwipe(_ sender: UIScreenEdgePanGestureRecognizer) {
        print("edge")
        showBackground()
    }
    
    @IBAction func didLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        print("swipe")
        hideBackground()
    }
}
