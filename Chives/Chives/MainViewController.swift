//
//  ViewController.swift
//  Chives
//
//  Created by Jackson Jessup on 8/18/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import UIKit
import QuartzCore

class MainViewController : UIViewController, RNFrostedSidebarDelegate {
    
    // ================================================================================
    //                          Constants
    // ================================================================================
    let TEXT_HOME : String = "Home"
    let TEXT_SETTINGS : String = "Settings"
    let TEXT_REMOTE : String = "Remote"
    
    
    // ================================================================================
    //                          Variables
    // ================================================================================
    @IBOutlet var allViewContainers : Array<UIView>!
    @IBOutlet var viwSettings : UIView!
    @IBOutlet var viwHome : UIView!
    @IBOutlet var viwRemote : UIView!
    
    var listOfDevices = NSMutableArray.array()
    
    let connectionDoctor = ConnectionDoctor()
    var callout : RNFrostedSidebar?
    var buttonNames : [String]?
    
    // ================================================================================
    //                              ViewDidLoad
    // ================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var panGesture = UISwipeGestureRecognizer(target: self, action: "menuPanGesture:")
        panGesture.direction = UISwipeGestureRecognizerDirection.Right;
        self.view.addGestureRecognizer(panGesture)
        
        var colorThree : UIColor = UIColor(red: (25/255.0), green: (25/255.0), blue: (80/255.0), alpha: 1.0)
        var colorTwo : UIColor = UIColor(red: (17/255.0), green: (15/255.0), blue: (25/255.0), alpha: 1.0)
        var colorOne : UIColor = UIColor(red: (5/255.0), green: (5/255.0), blue: (5/255.0), alpha: 1.0)
        var colors : NSArray = NSArray(objects: colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor)
        var locations : NSArray = NSArray(objects: 0.2, 0.3, 0.5)
        
        let headerLayer : CAGradientLayer = CAGradientLayer()
        headerLayer.colors = colors
        headerLayer.locations = locations
        headerLayer.frame = self.view.frame
        
        self.view.layer.addSublayer(headerLayer)
        self.view.layer.insertSublayer(headerLayer, atIndex: 0);
        
        println("go")
        var images : [UIImage] = [UIImage(named: "ButtonHome").changeImageColor(UIColor.whiteColor()),
            UIImage(named: "ButtonRemote").changeImageColor(UIColor.whiteColor()),
            UIImage(named: "ButtonSettings").changeImageColor(UIColor.whiteColor()) ]
        callout = RNFrostedSidebar(images: images)
        callout!.borderWidth = 2
        callout!.delegate = self
        
        buttonNames = [TEXT_HOME, TEXT_REMOTE, TEXT_SETTINGS]
        
        for viw : UIView in allViewContainers
        {
            viw.hidden = true
        }
        viwHome.hidden = false
    }
    
    func menuPanGesture(sender : UIPanGestureRecognizer)
    {
        callout?.show()
    }
    
    // ================================================================================
    //                            sidebar DELEGATE METHODS
    // ================================================================================
    func sidebar(sidebar: RNFrostedSidebar!, willShowOnScreenAnimated animatedYesOrNo: Bool) {
        var viw = UIView(frame: self.view.frame)
        viw.backgroundColor = UIColor(white: 0, alpha: 0)
        viw.tag = 99;
        self.view.addSubview(viw)
        
        UIView.animateWithDuration(0.17, animations: { () -> Void in
            viw.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        })
    }
    func sidebar(sidebar: RNFrostedSidebar!, willDismissFromScreenAnimated animatedYesOrNo: Bool) {
        UIView.animateWithDuration(0.17, animations: {
            self.view.viewWithTag(99)!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        }, completion: { finished in
                self.view.viewWithTag(99)!.removeFromSuperview()
        })
    }
    func sidebar(sidebar: RNFrostedSidebar!, didTapItemAtIndex index: UInt) {
        sidebar.dismiss()
        
        var title : String = buttonNames![Int(index)]
        for viw : UIView in allViewContainers
        {
            viw.hidden = true
            if(title == TEXT_HOME)
            {
                viwHome.hidden = false
            }
            else if(title == TEXT_SETTINGS)
            {
                viwSettings.hidden = false
            }
            else if(title == TEXT_REMOTE)
            {
                viwRemote.hidden = false
            }
        }
    }
    
}

