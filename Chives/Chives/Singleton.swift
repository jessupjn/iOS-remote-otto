//
//  Singleton.swift
//  
//
//  Created by Jackson Jessup on 8/22/14.
//
//

import Foundation

class Singleton : NSObject
{

    class func getSingleton() -> Singleton {
        return _Singleton
    }
    
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Storyboard", bundle: NSBundle.mainBundle())
    }
    
    
}
let _Singleton : Singleton = Singleton()