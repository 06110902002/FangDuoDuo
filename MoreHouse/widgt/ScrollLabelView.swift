//
//  ScrollLabelView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit



/// 滚动标签点击事件
protocol ScrollLabelListener {
    
    func onClickListener(view : UIView)
}


/// 上下滚动的标签视图--常用于上下滚动的广告标签中
class ScrollLabelView: UIView {
    
    var delegate : ScrollLabelListener?
    var titles : Array<String>?
    
    var nTitleIdx : Int = 1
    var nIdx : Int = 1
    
    var labelSize : CGRect = CGRect.zero
    
    
    

    
    /*
     Swift 中不加修饰的 init 方法都需要在方法中保证所有非 Optional 的实例变量被 赋值初始化
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initWithTitles(titles : Array<String>, andFrame:CGRect) {
        
        self.titles = titles
        self.labelSize = andFrame
        
        let btn : UIButton = UIButton.init(frame : CGRect.init(x: 0, y: 0, width: andFrame.width, height: andFrame.height))
        btn.tag = self.nIdx
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle(self.titles?[0], for: .normal)
        btn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        self.addSubview(btn)
        
        Timer.scheduledTimer(timeInterval: 3,
                             target:self,
                             selector:#selector(self.buildNextLabel),
                             userInfo:nil,
                             repeats:true)
        
    }
    
    func buildNextLabel() {
        
        
        self.nTitleIdx = self.nTitleIdx % (self.titles?.count)!
        self.nIdx = self.nIdx % (self.titles?.count)! == 0 ? (self.titles?.count)! : self.nIdx % (self.titles?.count)!
        
        let oldBtn : UIButton = self.viewWithTag(self.nIdx) as! UIButton
        let newBtn : UIButton = UIButton.init(frame: CGRect.init(x: 0, y: labelSize.height, width: labelSize.width, height: labelSize.height))
        
        newBtn.tag = self.nIdx + 1 > (self.titles?.count)! ? 1 :  self.nIdx + 1
        newBtn.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        newBtn.setTitleColor(UIColor.black, for: .normal)
        newBtn.setTitle(self.titles?[self.nTitleIdx], for: .normal)
        newBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(newBtn)
        
        
        UIView.animate(withDuration: 0.25, animations: {() -> Void in
        
            oldBtn.setY(y: -self.labelSize.height)
            newBtn.setY(y: 0)
        
        }, completion: {(finished) -> Void in
            
            oldBtn.removeFromSuperview()
            
        })
        
        self.nIdx += 1
        self.nTitleIdx += 1
    }
    
    func bindClickEvent(clickEvent : ScrollLabelListener) {
        
        delegate = clickEvent
    }
    
    func onClick(button : UIButton) {
        
        
        if let tmpClick = delegate{
        
            tmpClick.onClickListener(view: button)
        }
        
    }
    
    
}
