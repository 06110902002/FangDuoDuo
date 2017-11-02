//
//  BuildingTitleModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/30.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation

class BuildingTitleModel: BaseModel {
    
    
    lazy var title : String = String.init()
    
    override init() {
        super.init()
    }
    
    override func getItemType() -> CellItemType {
        
        return .buildingTitleType
    }
    
}
