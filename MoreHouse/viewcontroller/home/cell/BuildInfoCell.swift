//
//  BuildInfoCell.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/30.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class BuildInfoCell: BaseTabViewCell {
    
    
    lazy var imgBuild : UIImageView = UIImageView.init()
    
    lazy var labelBuildNmae : UILabel = UILabel.init()
    
    var buildData : BuildingTitleModel?
    
    override func initItemView() {
        
        imgBuild.frame = CGRect.init(x: 10, y: 10, width: 100, height: self.frame.height - 10)
        imgBuild.contentMode = .scaleAspectFit
        imgBuild.image = UIImage.init(named: "adv1.jpg")
        self.addSubview(imgBuild)
        
    }
    
    override func bindData(data: BaseModel?) {
        
    }
    
}
