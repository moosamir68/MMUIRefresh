//
//  ViewController.swift
//  MMUIRefresh
//
//  Created by moosamir68 on 05/14/2017.
//  Copyright (c) 2017 moosamir68. All rights reserved.
//

import UIKit
import MMUIRefresh

class ViewController: UIViewController {
    override func loadView() {
        super.loadView()
        self.view.initPullToRefresh();
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

