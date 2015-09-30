//
//  headView.swift
//  Shopping
//
//  Created by mudy on 15/9/24.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit
protocol headViewDelegate:class{//代表这个代理只能被一个类实现
    func clickedAtNum(clicked: Int)
    
}

class headView: UIView {
  
   weak  var delegate: headViewDelegate?
    
    @IBAction func headClick(sender: UIButton) {
      delegate!.clickedAtNum(sender.tag)
    
    }
    
}
