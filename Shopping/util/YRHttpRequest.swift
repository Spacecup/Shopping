//
//  YRHttpRequest.swift
//  JokeClient-Swift
//
//  Created by YANGReal on 14-6-5.
//  Copyright (c) 2014年 YANGReal. All rights reserved.
//

import UIKit
import Foundation

//class func connectionWithRequest(request: NSURLRequest!, delegate: AnyObject!) -> NSURLConnection!


class YRHttpRequest: NSObject {

    override init()
    {
        super.init();
    }
    /// 这种函数是什么意思？后面的completionHandler是干什么的
    class func requestWithURL(urlString:String,completionHandler:(data:AnyObject)->Void)
    {
        let URL = NSURL(string:urlString)
        let req = NSMutableURLRequest(URL:URL!)
        req.setValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:29.0) Gecko/20100101 Firefox/29.0",forHTTPHeaderField:"User-Agent")
        let queue = NSOperationQueue();
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: { response, data, error in
            if (error != nil)
            {
                dispatch_async(dispatch_get_main_queue(),
                {
                    print(error)
                    completionHandler(data:NSNull())
                })
            }
            else
            {
                let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                //返回的json数据
                dispatch_async(dispatch_get_main_queue(),
                    {
                        print(jsonData)
                        completionHandler(data:jsonData)
                        
                })

            }
        })
    }
    
    
    
}
