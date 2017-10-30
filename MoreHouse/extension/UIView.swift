//
//  UIView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import UIKit
// MARK: - 扩展UIView方便添加点击事件。除上此方法还有如下方法：
//子类化UIView 重写它的触摸事件即可
extension UIView {
    
    
    
    /// 扩展View的点击事件
    ///
    /// - Parameters:
    ///   - target: 响应点击事件的方法引用操持者
    ///   - action: 点击的事件
    func addOnClickListener(target: AnyObject, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gr)
    }
    
    
    
    func setX(x : CGFloat){
    
        var frame : CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    
    func x() -> CGFloat{
        
        return self.frame.origin.x
    }
    
    
    
    func setY(y : CGFloat){
        
        var frame : CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    
    func y() -> CGFloat{
        
        return self.frame.origin.y
    }
    
    
    func setWidth(width : CGFloat){
        
         var frame : CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    
    func width() -> CGFloat {
        
        return frame.size.width
    }
    
    
    func setHeight(height : CGFloat){
        
        var frame : CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
    
    func height() -> CGFloat {
        
        return frame.size.height
    }
    
    
    func setCenterX(centerX : CGFloat) {
        
        var center : CGPoint = self.center
        center.x = centerX
        self.center = center
    }
    
    func centerX() -> CGFloat {
        
        return self.center.x
    }
    
    
    func setCenterY(centerY : CGFloat) {
        
        var center : CGPoint = self.center
        center.y = centerY
        self.center = center
    }
    
    func centerY() -> CGFloat {
        
        return self.center.y
    }
}





















