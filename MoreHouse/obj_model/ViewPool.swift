//
//  ViewPool.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class ViewPool: BaseObjPool<UILabel> {
    
    
    override init() {
        
    }
    
    override func create() -> UILabel {
        
        let label : UILabel = UILabel.init()
        label.text = String.init(format: "%d", arc4random() % 100)
        
        return label
    }
    
}
