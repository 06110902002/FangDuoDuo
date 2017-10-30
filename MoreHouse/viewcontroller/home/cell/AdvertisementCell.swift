//
//  AdvertisementCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/25.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit


class AdvertisementCell: BaseTabViewCell {
    
    lazy var advertiseMentScrollView : RecycScrollView = RecycScrollView.init(frame: CGRect.init(x: 0, y: 0, width: 414, height: 100))
    
    var advData : AdvertisementModel?
    
    lazy var pageIndex : UIPageControl = UIPageControl.init()
    
    
    override func initItemView() {
       
        advertiseMentScrollView.alwaysBounceHorizontal = true
        advertiseMentScrollView.showsVerticalScrollIndicator = false
        advertiseMentScrollView.showsHorizontalScrollIndicator = false
        advertiseMentScrollView.isPagingEnabled = true
        
        //advertiseMentScrollView.setItemOnClickListener(onClick: ScrollViewListener.init())
        
        advertiseMentScrollView.onItemClick = {(view) -> Void in
        
            print("33---------------:\(view.tag)")
        }
        
        advertiseMentScrollView.onPageChangeListener = {(idx) -> Void in
        
            //print("38---------------:\(idx)")
            
            self.pageIndex.currentPage = idx
        }
        
        self.addSubview(advertiseMentScrollView)
        self.backgroundColor = UIColor.gray
        
        
        pageIndex.frame = CGRect.init(x: (self.frame.width - 30 ) / 2, y: 0, width: 30, height: 30)
        pageIndex.numberOfPages = 4
        pageIndex.currentPage = 0
        pageIndex.currentPageIndicatorTintColor = UIColor.blue
        pageIndex.pageIndicatorTintColor = UIColor.green
        self.addSubview(pageIndex)
    }
    override func layoutSubviews() {
        
        advertiseMentScrollView.frame = CGRect.init(x: 0, y: (self.frame.height - 100) / 2, width: self.frame.width, height: 100)
        

    }
    
    override func bindData(data: BaseModel?) {
        
        
        guard data != nil else {
            return
        }
        
        
        advData = data as! AdvertisementModel
        
        advertiseMentScrollView.addItems(items: (advData?.advList)!)
    
    }
}

