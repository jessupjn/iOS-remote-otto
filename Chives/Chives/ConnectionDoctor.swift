//
//  ConnectionDoctor.swift
//  Chives
//
//  Created by Jackson Jessup on 8/18/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import Foundation

class ConnectionDoctor : NSObject
{
    private
    let CHIVESCORE1 = "53ff73065075535137281087"
    let API_KEY = "408807d68df1c7551ea6bf4858444642e19ce641"
    
    var receivedData : NSMutableData = NSMutableData()
    
    internal
    override init()
    {
        super.init()
    }
    
    func makeAPIRequest(message : NSString)
    {
        println("MakeRequest: \(message)")
        
        
    }
    
}