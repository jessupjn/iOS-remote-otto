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
    @IBOutlet var scvButtonList : UIScrollView!
    @IBOutlet var lblDeviceName : UILabel!
    @IBOutlet var lblDeviceStatus : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func btnActionMenuOpen(sender : AnyObject)
    {
        (self.parentViewController! as MainViewController).callout!.show();
    }
    
    func rebuildRemoteWithType(name:NSString, type : NSString)
    {
        
        switch(type.lowercaseString)
        {
            case "tv":
                
                break;
            default:
                break;
        }
    }
    
}