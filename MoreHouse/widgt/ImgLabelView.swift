//
//  ImgLabelView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

/// 本类实现上面是一个图片，下面是一个lbael的控件
class ImgLabelView: UIView {
    
    var image:String = ""
    var sTips:String = "请设置"
    
    var img : UIImageView?
    var label : UILabel?
    
    var onClickListener:(_ tag:Int) ->Void = {(tag) -> Void in
        
        print("22-----------ImgLabelView empty onclick ")
        
    }
    
    //set方法
    func setImgRes(named:String){
        self.image = named
    }
    
    func setTitle(title:String) {
        self.sTips = title
    }
    
    func setTag(tag:Int) {
        self.tag = tag
    }
    
    func setTextColor(color : UIColor){
        
        guard label != nil else {
            return
        }
        label!.textColor = color
    }
    
    func setTextFont(font : UIFont) {
        guard label != nil else {
            return
        }
        label!.font = font

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /// 构建图片视图与文本
    func build(imgSize : CGSize,imgMarginTop : CGFloat, textMarginTop : CGFloat) {
        
        
        img = UIImageView(frame:CGRect(x:(self.frame.width - imgSize.width) / 2, y:imgMarginTop, width:imgSize.width, height:imgSize.height))
        img!.image = UIImage(named:image)
        img!.contentMode = UIViewContentMode.scaleAspectFill
        self.addSubview(img!)
        
        label = UILabel(frame:CGRect(x : 0, y : imgSize.height + textMarginTop, width : self.frame.width, height : 30))
        label!.text = sTips
        label!.textAlignment = NSTextAlignment.center
        label!.font = UIFont.systemFont(ofSize: 12)
        label!.textColor = UIColor.white
        self.addSubview(label!)
        
        
        self.addOnClickListener(target: self, action: #selector(tapGestureAction))
        
    }
    
    
    func tapGestureAction(){
        onClickListener(self.tag)
    }
}
