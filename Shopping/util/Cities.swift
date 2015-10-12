//
//  Cities.swift
//  我的测试
//
//  Created by mudy on 15/10/12.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import Foundation

class Cities: NSObject {
    
//    func getCitys()-> NSArray{
//        let path = NSBundle.mainBundle().pathForResource("cities.plist", ofType: nil)
//        let plistArray = NSArray(contentsOfFile: path) as? NSArray
//    
//        
//    }
    var name: String?
    var pinYin: String?
    var pinYinHead: String?
    var region: NSArray?
    
    
    static let properties = ["name", "pinYin", "pinYinHead", "region"]
    
    init(dict:[String: AnyObject]){
        super.init()
        
        for key in Cities.properties {
            if dict[key] != nil {
                setValue(dict[key], forKey: key)
            }
        }
    }
    
    override var description: String {
        let dict = dictionaryWithValuesForKeys(Cities.properties)
        return ("\(dict)")
    }
    
    
    
    class func getCitys() -> NSArray {
        let musicDictArray = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("cities.plist", ofType: nil)!)
        
        let musicModelsM = NSMutableArray(capacity: musicDictArray!.count)
        for musicDict in musicDictArray! {
            
            musicModelsM.addObject(Cities(dict: musicDict as! [String : AnyObject]))
        }
        
        return musicModelsM.copy() as! NSArray
    }
}
    
