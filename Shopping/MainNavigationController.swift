//
//  MainNavigationController.swift
//  Shopping
//
//  Created by mudy on 15/9/24.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = UIColor.orangeColor()
        let navigationTitleAttribute : NSDictionary = NSDictionary(objectsAndKeys: UIColor.blackColor(),NSForegroundColorAttributeName)
        self.navigationBar.titleTextAttributes = navigationTitleAttribute as [NSObject : AnyObject]
        
    }
    
   

       lazy var backBtn: UIButton = {
        //设置返回按钮的属性
        let backBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        backBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        backBtn.setImage(UIImage(named: "back_1"), forState: UIControlState.Normal)
        backBtn.setImage(UIImage(named: "back_2"), forState: UIControlState.Highlighted)
        backBtn.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        let btnW: CGFloat = AppWidth > 375.0 ? 50 : 44//注意设置类型
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        print(NSStringFromCGRect(backBtn.frame))
        
            return backBtn
        
        }()
    
    func back(){
    self.popViewControllerAnimated(true)
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
