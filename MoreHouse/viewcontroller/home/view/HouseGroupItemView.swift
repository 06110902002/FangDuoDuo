//
//  HouseGroupItemView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


/// 首页中间滚动列表--房子分组的item视图
class HouseGroupItemView: UIView {
    
    
    lazy var labelTitle : UILabel = UILabel.init()
    
    lazy var labelAbstract : UILabel = UILabel.init()
    
    lazy var imgHouseThumab : UIImageView = UIImageView.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iniView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func iniView() {
        
        self.backgroundColor = UIColor.orange
        
        labelTitle.font = UIFont.systemFont(ofSize: 16)
        labelTitle.text = "Title"
        labelTitle.textAlignment = .center
        labelTitle.backgroundColor = UIColor.red
        self.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        labelTitle.snp.makeConstraints(){(make) -> Void in
            
            make.top.equalTo(self).offset(15)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.height.equalTo(30)
            
        }
        
        
        labelAbstract.font = UIFont.systemFont(ofSize: 16)
        labelAbstract.text = "Abstract"
        labelAbstract.textAlignment = .center
        labelAbstract.backgroundColor = UIColor.gray
        self.addSubview(labelAbstract)
        labelAbstract.translatesAutoresizingMaskIntoConstraints = false
        
        labelAbstract.snp.makeConstraints(){(make) -> Void in
            
            make.top.equalTo(labelTitle.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.height.equalTo(25)
            
        }
        
        
    }
    
    func setTitle(title : String) {
        
        labelTitle.text = title
    }
    
    func setAbstract(abstract : String) {
        
        labelAbstract.text = abstract
    }
    
//    func setHouseImgUrl(imgUrl : String) {
//        
//        imgHouseThumab =
//    }
    

    
}
