//
//  BuildingTitleCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/30.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class BuildingTitleCell: BaseTabViewCell {
    
    lazy var labelTitle = UILabel.init()
    var titleData : BuildingTitleModel?
    
    
    override func initItemView() {
        
        labelTitle.font = UIFont.systemFont(ofSize: 16)
        labelTitle.text = "热门楼盘"
        labelTitle.frame = CGRect.init(x: 10, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(labelTitle)
        
    }
    
    override func bindData(data: BaseModel?) {
        
        guard data != nil else {
            return
        }
        
        titleData = data as! BuildingTitleModel
        labelTitle.text = titleData?.title
    }
}
