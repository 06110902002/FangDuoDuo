//
//  NavMenuModel.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation

class NavMenuModel: BaseModel {
    
    lazy var titles : Array<String> = Array<String>.init()
    
    lazy var icons : Array<String> = Array<String>.init()
    
    override func getItemType() -> CellItemType {
        return.navMenuType
    }
    
}
