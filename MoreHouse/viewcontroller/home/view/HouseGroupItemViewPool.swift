//
//  HouseGroupItemViewPool.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/20.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

/// 首页房子分组滚动列表---这个滚动列表使用对象池实现
class HouseGroupItemViewPool: BaseObjPool<HouseGroupItemView> {
    
    
    
    override init() {
        
    }
    
    override func create() -> HouseGroupItemView {
        
        let itemView : HouseGroupItemView = HouseGroupItemView.init(frame: CGRect.init(x: 0, y: 15, width: 120, height: 150))

        return itemView
    }

    
}
