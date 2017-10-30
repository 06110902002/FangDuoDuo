//
//  HomeHouseGroupModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation


/// 首页中间数据分组模型
class HomeHouseGroupModel: BaseModel {
    
    lazy var houseGroupItemList : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
    
    override init() {
        super.init()
    }
    
    override func getItemType() -> CellItemType {
        
        return .houseGroupType
    }
    
}


class HomeHouseGroupItemModel: NSObject {
    
    var title : String?
    
    var abstract : String?
    
    var houseThumabUrl : String?
    
    override init() {
        
        title = "旅居地产"
        abstract = "总价35万起"
        houseThumabUrl = ""
    }
}
