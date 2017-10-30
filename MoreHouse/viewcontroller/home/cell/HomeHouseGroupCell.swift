//
//  HomeHouseGroupModelCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/// 首页房子分组单元格视图--本单元格使用UIScrollView代替横向的UItableView
/// 这个单元格只放一个滚动容器，itemView抽出来
class HomeHouseGroupCell: BaseTabViewCell {
    
    lazy var houseGroupScrollView : UIScrollView = UIScrollView.init()
    
    var houseGroupData : HomeHouseGroupModel?
    
    lazy var mPool : HouseGroupItemViewPool = HouseGroupItemViewPool.init()
    
    var nPageMaxCount : Int = 0
    
    var fTotalOffsetX : CGFloat = 0     //记录已经滑动的距离

    var nLastTag :Int = -1
    
    var nHasAddCount : Int = -1
    
    var nLastRightRecycIdx = -1
    
    override func initItemView() {
        
        houseGroupScrollView.backgroundColor = UIColor.green
        houseGroupScrollView.alwaysBounceHorizontal = true
        houseGroupScrollView.showsVerticalScrollIndicator = false
        houseGroupScrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(houseGroupScrollView)
        
        houseGroupScrollView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
    override func layoutSubviews() {
        
        houseGroupScrollView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        nPageMaxCount = Int(ceil(self.frame.width / CGFloat(140)))   //页面最大个数为 单元格宽度/单个item宽度
        //print("45-----------:\(nPageMaxCount)")
    }
    
    
    override func bindData(data: BaseModel?) {
        
        if data != nil && houseGroupData != data{
        
            houseGroupData = data as? HomeHouseGroupModel
        
            houseGroupScrollView.contentSize = CGSize.init(width: (houseGroupData?.houseGroupItemList.count)! * 140 + 20, height: Int(self.frame.height))
            
            for (idx,item) in (houseGroupData?.houseGroupItemList.enumerated())!{
            
                if CGFloat(idx * 140 + 20) > self.frame.width{       //对于走出屏幕范围的对象暂时不直接创建，而是是通过复用对象来达到显示目的
                
                    break
                }
                
                let itemView : HouseGroupItemView = mPool.getObjFromPool()
                
                let posX : CGFloat = idx == 0 ? 20 : (itemView.width() + CGFloat(20))  * CGFloat(idx)  + CGFloat(20)
                
                itemView.setX(x: posX )
                itemView.tag = idx + 1
                itemView.setTitle(title: item.title!)
                itemView.setAbstract(abstract: item.abstract!)
                
                houseGroupScrollView.addSubview(itemView)
                
                nHasAddCount += 1
            }
        }
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentOffset"{
            
            let offset : CGPoint = change![NSKeyValueChangeKey.newKey] as! CGPoint
            let offsetX : CGFloat = offset.x
            
            let oldOffset : CGPoint = change![NSKeyValueChangeKey.oldKey] as! CGPoint
            let oldOffsetX : CGFloat = oldOffset.x
            
            let deltaOfOffsetX : CGFloat = offsetX - oldOffsetX
        
            
            //print("91------------offsetX :\(offsetX)    deltaX : \(deltaOfOffsetX)  recycIdx : \(Int(offsetX / 140))")
            
            
            
            if offsetX > 0 && deltaOfOffsetX > 0 {      //单纯向左滑
                
                let nIdx = houseGroupScrollView.subviews.count
                
                if nLastTag >= (houseGroupData?.houseGroupItemList.count)! && houseGroupScrollView.viewWithTag(nLastTag) != nil{
                    
                    return
                }
                
                if(offsetX > 20 && offsetX <= 140){     //特殊情况，左边隐藏半个，右边显示半个，此时也需要创建一个itemView出来
                    
                    if nIdx > nPageMaxCount {
                    
                        return
                    }

                    let itemView : HouseGroupItemView = mPool.getObjFromPool()
                    
                    let posX : CGFloat = (itemView.width() + CGFloat(20))  * CGFloat(nIdx)  + CGFloat(20)
                    
                    itemView.setX(x: posX )
                    itemView.tag = nIdx + 1
                    itemView.setTitle(title: (houseGroupData?.houseGroupItemList[nIdx].title)!)
                    itemView.setAbstract(abstract: (houseGroupData?.houseGroupItemList[nIdx].abstract!)!)
                    
                    houseGroupScrollView.addSubview(itemView)
                    
                    nLastTag = nIdx + 1
                    
                    nHasAddCount += 1
                    
                }
                
                let recycIdx : Int = Int(offsetX / 140)
                
                var recycObj : HouseGroupItemView? = houseGroupScrollView.viewWithTag(recycIdx) as? HouseGroupItemView
                
                let lastItemView : HouseGroupItemView? = houseGroupScrollView.viewWithTag(recycIdx + nPageMaxCount) as? HouseGroupItemView
                //print("124------------:recycIdx:\(recycIdx)  pageCount:\(String(describing: lastItemView)))")
                if recycObj != nil && lastItemView != nil{
                    
                    mPool.putObj2Pool(obj: &recycObj)
                    recycObj?.removeFromSuperview()
                    
                    let itemView : HouseGroupItemView = mPool.getObjFromPool()
                    
                    itemView.setX(x: lastItemView!.x() + 140)
                    itemView.tag = recycIdx + nPageMaxCount + 1
                    //print("138-----------:\(recycIdx + nPageMaxCount + 1)  titles:\(houseGroupData?.houseGroupItemList.count)")
                    
                    itemView.setTitle(title: (houseGroupData?.houseGroupItemList[(lastItemView?.tag)!].title)!) //测试之用  注释之后，可以查看回收的是那一个
                    itemView.setAbstract(abstract: (houseGroupData?.houseGroupItemList[(lastItemView?.tag)!].abstract!)!)
                
                    houseGroupScrollView.addSubview(itemView)
                    nLastTag = recycIdx + nPageMaxCount + 1
                    nHasAddCount += 1
                }
                fTotalOffsetX = offsetX
            }
            
            if offsetX > 0 && deltaOfOffsetX < 0 {  //向右滑，此时左边有一部分的内容超出了滚动列表可见页面
                
                let rightOffsetX : CGFloat = fTotalOffsetX + 140 - offsetX
                
                //let recycIdx : Int = Int(offsetX / 140)
                //print("147------------total: \(fTotalOffsetX)  offsetX:\(offsetX)")
                
                if rightOffsetX > 0 && rightOffsetX < 20{           //特殊情况，左边隐藏半个，右边显示半个，此时也需要创建一个itemView出来
                
                    let nIdx = houseGroupScrollView.subviews.count
                    
                    if nIdx > (nPageMaxCount + 1) || nIdx >= (houseGroupData?.houseGroupItemList.count)!{
                        
                        return
                    }
                    
                    let firstItemView : HouseGroupItemView = houseGroupScrollView.viewWithTag(nLastTag - nPageMaxCount) as! HouseGroupItemView
                  
                
                    let itemView : HouseGroupItemView = mPool.getObjFromPool()
                    
                    itemView.setX(x: firstItemView.x() - 140)
                    itemView.tag = firstItemView.tag - 1
                
                    itemView.setTitle(title: (houseGroupData?.houseGroupItemList[firstItemView.tag - 2].title)!)
                    itemView.setAbstract(abstract: (houseGroupData?.houseGroupItemList[firstItemView.tag - 2].abstract!)!)
                    
                    houseGroupScrollView.addSubview(itemView)
                }
               
                
                if rightOffsetX >= 120 {     //达到回收对象的条件
                    
                    
                    let rightIdx : Int = Int(rightOffsetX / 140)
                    
                    if rightIdx < 1 || rightIdx == nLastRightRecycIdx{
                        return
                    }
                    
                    let recycIdx : Int = nLastTag
                    
                    //print("202-------------nLastTag: \(nLastTag) rightIdx:\(rightIdx)  availableList.count:\(mPool.availableList.count)")
                    var recycObj : HouseGroupItemView? = houseGroupScrollView.viewWithTag(recycIdx) as? HouseGroupItemView
                    print("181-----------recycIdx: \(recycIdx): recycbj: \(String(describing: recycObj?.labelTitle.text))")
                    let firstItemView : HouseGroupItemView? = houseGroupScrollView.viewWithTag(recycIdx - nPageMaxCount) as? HouseGroupItemView
                   
                    //print("207-------------:\((recycObj?.x())! - offsetX)")
                    
                    if recycObj != nil && firstItemView != nil{
                    
                        if (firstItemView?.x())! <= 100 {
                        
                            return
                        }
                        
                        
                        print("208-----------firstTag: \(String(describing: firstItemView?.tag)): recycbj: \(String(describing: recycObj?.labelTitle.text))")
                        nLastTag = (recycObj?.tag)! - 1
                        nLastRightRecycIdx = rightIdx
                        
                        mPool.putObj2Pool(obj: &recycObj)
                        recycObj?.removeFromSuperview()
                        
                        
                        
                        let itemView : HouseGroupItemView = mPool.getObjFromPool()
                        itemView.setX(x: (firstItemView?.x())! - CGFloat(140))
                        itemView.tag = (firstItemView?.tag)! - 1
                        
                        itemView.setTitle(title: (houseGroupData?.houseGroupItemList[(firstItemView?.tag)! - 2].title)!)       //测试之用  注释之后，可以查看回收的是那一个
                        itemView.setAbstract(abstract: (houseGroupData?.houseGroupItemList[(firstItemView?.tag)! - 2].abstract!)!)
                        //print("186-----------firstItemView:\(String(describing: firstItemView?.labelTitle.text))  recycObj:\(String(describing: recycObj?.labelTitle.text))")
                        
                        houseGroupScrollView.addSubview(itemView)
                        
                    }
                }
                
            }
        }
    }
    
    deinit {
        houseGroupScrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    
}
