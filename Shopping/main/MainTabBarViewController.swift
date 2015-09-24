//
//  MainTabBarViewController.swift
//  Shopping
//
//  Created by mudy on 15/9/24.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllChildVC()
      
    }
    
    //初始化所有子视图控制器
    func setAllChildVC(){
        tabbarAddChindVC(ShouYeTableViewController(), title: "首页", imageName: "设置_16.png", selectedImageName: "设置_16.png")
        
        tabbarAddChindVC(TuanGouTableViewController(), title: "团购", imageName: "设置_18.png", selectedImageName: "设置_18.png")
        
        tabbarAddChindVC(FuJinViewController(), title: "附近", imageName: "首页_03.png", selectedImageName: "首页_03.png")
        
        
    }
    
    //添加子控制器
    func tabbarAddChindVC(vc:UIViewController, title:String,imageName:String,selectedImageName:String){
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
//        let nav = UINavigationController(rootViewController: vc)
        let nav2 = MainNavigationController(rootViewController: vc)
        
        addChildViewController(nav2)
        
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
