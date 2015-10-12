//
//  cityGroups.swift
//  我的测试
//
//  Created by mudy on 15/10/12.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import Foundation
class CityGroups: NSObject {
    var cities: String?
    var title: String?
   
    
    
    static let properties = ["cities", "title"]
    
    init(dict:[String: AnyObject]){
        super.init()
        
        for key in CityGroups.properties {
            if dict[key] != nil {
                setValue(dict[key], forKey: key)
            }
        }
    }
    
    override var description: String {
        let dict = dictionaryWithValuesForKeys(CityGroups.properties)
        return ("\(dict)")
    }
    
    
    
    class func getCitys() -> NSArray {
        let musicDictArray = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("cityGroups.plist", ofType: nil)!)
        
        let musicModelsM = NSMutableArray(capacity: musicDictArray!.count)
        for musicDict in musicDictArray! {
            
            musicModelsM.addObject(CityGroups(dict: musicDict as! [String : AnyObject]))
        }
        
        return musicModelsM.copy() as! NSArray
    }
 
    
}