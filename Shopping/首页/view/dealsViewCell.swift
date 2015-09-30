//
//  dealsViewCell.swift
//  Shopping
//
//  Created by mudy on 15/9/30.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit

class dealsViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dealImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    
    var data = NSDictionary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
            titleLabel.text = data["title"] as? String
            var imgUrl = data["image_url"] as? String
            self.dealImage.setImage(imgUrl!, placeHolder: UIImage(named: "my_2"))
            //        var currentPrice = data["current_price"] as! Double
            currentPriceLabel.text = String(stringInterpolationSegment: data["current_price"] as! Double)
            oldPriceLabel.text = String(stringInterpolationSegment: data["list_price"] as! Double)
            detailLabel.text = data["description"] as? String

   }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
