//
//  HouseHeadLineCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class HouseHeadLineCell: BaseTabViewCell {
    
    lazy var headLineIcon : UIImageView = UIImageView.init()
    
    lazy var rightArrow : UIImageView = UIImageView.init()
    
    var houseHeadLineData : HouseHeadLineModel?
    
    lazy var  mPool : ViewPool = ViewPool.init()
    
    var nProduceCount : Int = 1
    
    var scrollLabel : ScrollLabelView?

    
    override func initItemView() {
        
        headLineIcon.image = UIImage.init(named: "ic_house_head_lines")
        //headLineIcon.backgroundColor = UIColor.gray
        headLineIcon.translatesAutoresizingMaskIntoConstraints = false
        headLineIcon.contentMode = .scaleAspectFit
        self.addSubview(headLineIcon)
        
        headLineIcon.snp.makeConstraints(){(make) -> Void in
            
            make.leading.equalTo(self).offset(20)
            make.centerY.equalTo(self)
            make.width.equalTo(100)
            make.height.equalTo(25)
            
        }
        
        let rightArrow :UIImageView = UIImageView.init(image: UIImage.init(named: "ic_next"))
        rightArrow.translatesAutoresizingMaskIntoConstraints = false
        rightArrow.contentMode = .scaleAspectFit
        self.addSubview(rightArrow)
        rightArrow.snp.makeConstraints(){(make) -> Void in
            
            make.trailing.equalTo(self).offset(-10)
            make.centerY.equalTo(self)
            make.width.equalTo(10)
            make.height.equalTo(40)
            
        }
        
        let titles : [String] = ["买学区房，需要注意避免哪些风险","\"阴阳合同\"危害大，切莫因小失大 ","如果没有第三方，买卖双方自己交易的话靠谱吗？"]
        
        scrollLabel = ScrollLabelView.init(frame: CGRect.init(x: 130, y: 5, width: 240, height: 40))
        scrollLabel?.initWithTitles(titles: titles, andFrame: CGRect.init(x: 130, y: 5, width: 240, height: 40))
        scrollLabel?.bindClickEvent(clickEvent: self)
        self.addSubview(scrollLabel!)
        
    }
    override func bindData(data: BaseModel?) {
        
        if data != nil && houseHeadLineData != data{
        
            houseHeadLineData = data as? HouseHeadLineModel
            
            if (houseHeadLineData?.headLineMsg.count)! > 0 {
                
            }
        }
        
    }
    
}

extension HouseHeadLineCell : ScrollLabelListener{

    func onClickListener(view: UIView) {
        
        print("72-------------:\(view.tag)")
    }

}

