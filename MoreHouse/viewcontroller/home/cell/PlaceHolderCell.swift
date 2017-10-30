//
//  PlaceHolderCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

/// 占位单元格
class PlaceHolderCell : BaseTabViewCell{


    
    override func initItemView() {
        
        //self.backgroundColor = UIColor.gray
        label = UILabel(frame:CGRect(x : 10.0 , y : self.center.y, width : 80, height:30))
        label?.text = "4245245245245"
        self.addSubview(label!)
    }
    
    override func bindData(data: BaseModel?) {
        
    }
    
}
