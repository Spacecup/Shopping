//
//  FuJinViewController.swift
//  Shopping
//
//  Created by mudy on 15/9/24.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit

class FuJinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "附近"
        
        let cityBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        
        var imageV = UIImageView(image:UIImage(named:  "首页_06.png")) as UIImageView
        imageV.frame = CGRectMake(30, 0, 20, 20)
        imageV.backgroundColor = UIColor.blackColor()
        cityBtn.addSubview(imageV)
        
        cityBtn.imageView?.image = UIImage(named: "首页_06.png")
        cityBtn.setTitle("北京", forState: UIControlState.Normal)
        cityBtn.titleLabel?.backgroundColor = UIColor.blackColor()
        cityBtn.imageView?.backgroundColor = UIColor.greenColor()
        cityBtn.backgroundColor = UIColor.redColor()
        cityBtn.frame = CGRectMake(110, 400, 100, 60)
        cityBtn.addTarget(self, action: "citySelectedBtn", forControlEvents: UIControlEvents.TouchUpInside)
        cityBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 60)
        cityBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 60, 0, 0)
        self.view.addSubview(cityBtn)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
