//
//  AdvertisementViewPool.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/25.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit



/// 首页中间广告轮播图池
class AdvertisementViewPool : BaseObjPool<UIImageView> {
    
    
    override init() {
        
    }
    
    override func create() -> UIImageView {
        
        let itemView : UIImageView = UIImageView.init()
        
        return itemView
    }
    
    
}
