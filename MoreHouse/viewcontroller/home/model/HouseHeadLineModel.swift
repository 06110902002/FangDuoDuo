//
//  HouseHeadLineModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation



/// 房市头条 数据模型
class HouseHeadLineModel : BaseModel{

    lazy var headLineMsg : Array<String> = Array<String>.init()
    
    override init() {
        super.init()
    }
    
    override func getItemType() -> CellItemType {
        
        return.houseHeadLineType
    }
}
