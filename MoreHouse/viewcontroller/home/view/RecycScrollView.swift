//
//  RecycScrollView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/25.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit


//可循环滚动的列表
class RecycScrollView: UIScrollView {
    
    
    lazy var itemArrays : Array<String> = Array<String>.init()
    
    lazy var mPool : AdvertisementViewPool = AdvertisementViewPool.init()
    
    var nCount : Int = 0     //遍历索引
    
    var nLastImgIdx : Int = -1
    
    var MAX_SIZE : Int = 0
    
    var time : Timer?

    
    var onItemClick : (UIView) -> Void = {(view) -> Void in}
    var onPageChangeListener : (Int) -> Void = {(idx) -> Void in }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
        delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        
       

    }
    
    
    func addItems(items : Array<String>) {
        
        self.itemArrays = items
        
        self.itemArrays.insert(items[items.count - 1], at: 0)
        self.itemArrays.append(items[0])
        
        MAX_SIZE = itemArrays.count
        
        self.contentSize = CGSize.init(width: CGFloat(itemArrays.count) * UIScreen.main.bounds.width, height: 100)
        
        for (idx,item) in self.itemArrays.enumerated(){
            
            let img : UIButton = UIButton.init()
            img.frame = CGRect.init(x: CGFloat(idx) * self.frame.width, y: 0, width: UIScreen.main.bounds.width, height: self.frame.height)
            img.tag = idx + 1
            img.setTitle(String.init(format: "%d", idx), for: .normal)
            //img.setImage(UIImage.init(named: item), for: .normal)
            //img.imageView?.contentMode = .scaleAspectFill
            img.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
            
            self.addSubview(img)
            
        }
        
        self.setContentOffset(CGPoint.init(x: UIScreen.main.bounds.width, y: 0), animated: false)
        
        time = Timer.scheduledTimer(timeInterval: 3,
                             target:self,
                             selector:#selector(self.startCarousel),
                             userInfo:nil,
                             repeats:true)
        
        
    }
    
    func onClick(button : UIView)  {
        guard onItemClick(button) != nil else {
            return
        }
        
       onItemClick(button)
    }
    
    func startCarousel() {
        
        var offsetX : CGFloat = self.contentOffset.x
        
        offsetX += self.frame.width
        
        self.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentOffset"{
        
            let offset : CGPoint = change![NSKeyValueChangeKey.newKey] as! CGPoint
            let offsetX : CGFloat = offset.x
            
            let nCurImgIdx : Int = Int(offsetX / self.frame.width)
            //print("118--------------:\(nCurImgIdx)")
            
            let idex = (offsetX - self.frame.width) / self.frame.width
            onPageChangeListener(Int(idex))
            print("147------------:\(Int(idex)) ")
            
            if (nCurImgIdx == 0) {
                
                //方法2，该方法要求设置contentSize时，任一方向就算不滚动也不能为0，否则无效
                //[self.loopScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * (MAX_SIZE-2), 0, SCREEN_WIDTH, IMG_HEIGHT) animated:NO];
                //self.pageIndicator.currentPage = MAX_SIZE - 2;
                
                self.setContentOffset(CGPoint.init(x: self.frame.width * CGFloat((MAX_SIZE-2)), y: 0), animated: false)
                //onPageChangeListener(MAX_SIZE - 2 - 1)
                
            }
                
            else if(nCurImgIdx == MAX_SIZE - 1) {
               
                
                self.setContentOffset(CGPoint.init(x: self.frame.width, y: 0), animated: false)
                
                //[self.loopScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, IMG_HEIGHT) animated:NO];
                //self.pageIndicator.currentPage = 0;
                
                //onPageChangeListener(0)
                
            }else{
            
               // onPageChangeListener(nCurImgIdx)
            }
            
            
           
            
        }
    }
    
    
    
    deinit {
        
        self.removeObserver(self, forKeyPath: "contentOffset", context: nil)
        
        time?.invalidate()
        time = nil
    }
    
    
}

extension RecycScrollView : UIScrollViewDelegate{


    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        time?.invalidate()
        
        time = nil
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        time = Timer.scheduledTimer(timeInterval: 3,
                                    target:self,
                                    selector:#selector(self.startCarousel),
                                    userInfo:nil,
                                    repeats:true)
    }
    

}
