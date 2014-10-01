//
//  SettingsVC.swift
//  Chives
//
//  Created by Jackson Jessup on 8/22/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import Foundation

class SettingsVC : UITableViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var imvHeaderImg : UIImageView!
    @IBOutlet var lblHeader : UILabel!
    
    var options : Array<String> = ["Blah", "Add New Device..."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imvHeaderImg.image = imvHeaderImg.image?.changeImageColor(UIColor.whiteColor())
        lblHeader.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 35)
        
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.separatorColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.6)
//        var view : UIView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 66))
//        view.backgroundColor = UIColor(red: 6/255, green: 6/255, blue: 6/255, alpha: 0.8)
//        
//        var label : UILabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
//        label.text = "SETTINGS"
//        label.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 51)
//        label.textColor = UIColor.whiteColor()
//        label.backgroundColor = UIColor.clearColor()
//        label.sizeToFit()
//        label.center = view.center
//        
//        var button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
//        button.frame = CGRectMake(8, 17, 40, 30)
//        button.imageView.image = UIImage(named: "MenuIcon").changeImageColor(UIColor.whiteColor())
//        button.imageView.image = button.imageView.image.changeImageColor(UIColor.whiteColor())
//        button.imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        button.addTarget(self, action: "btnActionMenuOpen:", forControlEvents: UIControlEvents.TouchUpInside)
//        button.layer.borderColor = UIColor.whiteColor().CGColor
//        button.layer.borderWidth = 1
//        
//        var img : UIImageView = UIImageView(frame: CGRectMake(tableView.frame.size.width - 48, 13, 40, 40))
//        img.image = UIImage(named: "ButtonSettings").changeImageColor(UIColor.whiteColor())
//        
//        view.addSubview(label)
//        view.addSubview(button)
//        view.addSubview(img)
//        tableView?.tableHeaderView = view
    }
    
    @IBAction func btnActionMenuOpen(sender : AnyObject)
    {
        (self.parentViewController! as MainViewController).callout!.show();
    }
    
    //
    //                  UITABLEVIEW DELEGATE METHODS
    //
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var view : UIView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 30))
        view.backgroundColor = UIColor(red: 70/255.0, green: 70/255.0, blue: 70/255.0, alpha: 0.35)
        
        var label : UILabel = UILabel(frame: CGRectMake(10, 6, 0, 0))
        switch(section){
        case 0:
            label.text = "General"
            break
        case 1:
            label.text = "Devices"
            break
        default:
            break
        }
        label.font = UIFont.systemFontOfSize(15)
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.sizeToFit()
        view.addSubview(label)
        
        return view
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section
        {
        case 0:
            return options.count
        case 1:
//            var (files, error) = listFilesAtPath("/Documents")
//            if(error != nil) { NSLog("error in file retrival: %@", error!) }
//            NSLog("FILE COUNT: %i", files.count)
            return 0//files.count
        case 2:
            break
        default:
            break
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
//        if(cell == nil)
//        {
//            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
//        }
        var cell = UITableViewCell() as UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        if(indexPath.section == 0)
        {
            cell.textLabel?.text = options[indexPath.row]
            cell.textLabel?.textColor = UIColor.whiteColor()
        }
        return cell
    }
    
    
    func listFilesAtPath(path : String) -> (filenames: [String], error: NSError?)
    {
        println("Listing Files")
        
        var error: NSError? = nil
        let contents = NSFileManager.defaultManager().contentsOfDirectoryAtPath(path, error: &error)
        if contents == nil {
            return ([], error)
        }
        else {
            let filenames = contents as [String]
            return (filenames, nil)
        }
    }
    
}