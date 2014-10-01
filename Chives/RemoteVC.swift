//
//  RemoteVC.swift
//  Chives
//
//  Created by Jackson Jessup on 9/2/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import Foundation

class RemoteVC : UIViewController
{
    @IBOutlet var imvHeaderImg : UIImageView!
    @IBOutlet var lblHeader : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imvHeaderImg.image = imvHeaderImg.image?.changeImageColor(UIColor.whiteColor())
        lblHeader.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 35)

    }
    
    @IBAction func btnActionMenuOpen(sender : AnyObject)
    {
        self.frostedViewController.presentMenuViewController()
    }
    
}