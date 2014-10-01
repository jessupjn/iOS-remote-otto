//
//  ViewController.swift
//  Chives
//
//  Created by Jackson Jessup on 8/18/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import UIKit
import QuartzCore

class MainViewController: UIViewController, MenuVCDelegate {

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
    
    // ================================================================================
    //                              ViewDidLoad
    // ================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var panGesture = UIPanGestureRecognizer(target: self, action: "menuPanGesture:")
        self.view.addGestureRecognizer(panGesture)
        
        var menuVC = self.frostedViewController.menuViewController as MenuVC
        menuVC.delegate = self
        
        var colorTwo : UIColor = UIColor(red: (26/255.0), green: (23/255.0), blue: (97/255.0), alpha: 1.0)
        var colorOne : UIColor = UIColor(red: (5/255.0), green: (5/255.0), blue: (5/255.0), alpha: 1.0)
        var colors : NSArray = NSArray(objects: colorOne.CGColor, colorTwo.CGColor)
        var locations : NSArray = NSArray(objects: 0.1, 0.9)
        
        let headerLayer : CAGradientLayer = CAGradientLayer()
        headerLayer.colors = colors
        headerLayer.locations = locations
        headerLayer.frame = self.view.frame
        
        self.view.layer.addSublayer(headerLayer)
        self.view.layer.insertSublayer(headerLayer, atIndex: 0);
        
        self.didSelectMenuItem("Home")
    }
    
    func menuPanGesture(sender : UIPanGestureRecognizer)
    {
        self.frostedViewController.panGestureRecognized(sender)
    }
    
    // ================================================================================
    //                            MENUVC DELEGATE METHODS
    // ================================================================================
    func didSelectMenuItem(title: String!) {
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

