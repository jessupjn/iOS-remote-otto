//
//  ConnectionDoctor.swift
//  Chives
//
//  Created by Jackson Jessup on 8/18/14.
//  Copyright (c) 2014 Jackson Jessup. All rights reserved.
//

import Foundation

class ConnectionDoctor : NSObject, NSURLConnectionDelegate, NSURLConnectionDataDelegate
{
    private
    let CHIVESCORE1 = "53ff73065075535137281087"
    let API_KEY = "408807d68df1c7551ea6bf4858444642e19ce641"
    let URL_STRING = ""
    
    internal
    func makeAPIRequest(message : NSString)
    {
        var url = NSURL.URLWithString(URL_STRING)// Creating URL
        var request = NSURLRequest(URL: url)// Creating Http Request
        
        //Making request
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
        println("MakeRequest: \(message)")
        
    }
    
    
/* pragma mark - NSURLConnectionDataDelegate */
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        println("ConnectionError: \(error)")
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        println("DidReceiveResponse")
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        println("connectionDidFinishLoading")
    }
    
}