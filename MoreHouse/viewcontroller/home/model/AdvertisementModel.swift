//
//  AdvertisementModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/25.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation

class AdvertisementModel: BaseModel {
    
    lazy var advList : Array<String> = Array<String>.init()
    
    
    override init() {
        super.init()
    }
    
    override func getItemType() -> CellItemType {
        
        return .advertisementType
    }
}
