//
//  HomeVC.swift
//  Chives
//
//  Created by Jackson Jessup on 8/22/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import Foundation

class HomeVC : UIViewController
{
    @IBOutlet var btnMenu : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenu.imageView?.image = btnMenu.imageView?.image?.changeImageColor(UIColor.whiteColor())
        
    }
    
    @IBAction func btnActionMenuOpen(sender : AnyObject)
    {
        self.frostedViewController.presentMenuViewController()
    }
}