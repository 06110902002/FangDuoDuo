//
//  BuildInfoModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/30.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation

class BuildInfoModel: BaseModel {
    
    lazy var buildIcon : String = String.init()
    lazy var buildName : String = String.init()
    
    override func getItemType() -> CellItemType {
        
        return.buildInfoType
    }
    
}
