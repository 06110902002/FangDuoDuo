//
//  NavMenuCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class NavMenuCell: BaseTabViewCell {
    
    var dataModel : NavMenuModel?
    
    override func initItemView() {
        
        //self.backgroundColor = UIColor.lightGray
        
    }
    
    override func layoutSubviews() {
        
        for idx in 10 ..< 15{
            
            let tmpSubView = self.viewWithTag(idx)
            
            guard tmpSubView != nil else {
                break
            }
            let frame : CGRect = CGRect.init(x: (idx - 10) * Int((self.frame.width) / 5) + 10,
                                             y: 5,
                                             width: Int((self.frame.width) / 5),
                                             height: 90)
            
            tmpSubView?.frame = frame
        }
    }
    
    override func bindData(data: BaseModel?) {
        
        if data != nil && dataModel != data{
            
            dataModel = data as? NavMenuModel
            
            guard dataModel != nil else {
                return
            }
            
            
            for idx in 10 ..< 15{
            
                guard self.viewWithTag(idx) != nil else {
                    break
                }
                self.viewWithTag(idx)?.removeFromSuperview()
            }
            
            for i in 0 ..< 1{
                
                for j in 0 ..< 5{
                    
                    if i * 5 + j >= (dataModel?.titles.count)! {
                        
                        break
                    }
                    
                    let menuItem = ImgLabelView.init(frame: CGRect(x : j * Int((self.frame.width) / 5),
                                                                   y : 0,
                                                                   width : Int((self.frame.width) / 5),
                                                                   height : 90))
                    

                    menuItem.image = (dataModel?.icons[i * 5 + j])!
                    menuItem.sTips = (dataModel?.titles[ i * 5 + j])!
                    menuItem.build(imgSize : CGSize.init(width: 50, height: 50),imgMarginTop: 0,textMarginTop: 5)
                    let font : UIFont = UIFont.systemFont(ofSize: 14)
                    menuItem.setTextFont(font: font)
                    menuItem.setTextColor(color: UIColor.black)
                    menuItem.tag = i * 5 + j + 10
                    menuItem.onClickListener = {(tag:Int) -> Void in
                        print("40--------------\(tag)")
                    }
                    self.addSubview(menuItem)
                }
            }
            

        }
    }
}
