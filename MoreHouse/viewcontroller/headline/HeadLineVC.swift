//
//  HeadLineVC.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/17.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class HeadLineVC: BaseVC {
    
    
    lazy var scrollView : UIScrollView = UIScrollView.init()
    
    override func viewDidLoad() {
        
        initView()
        
    }
    
    func initView() {
        
        scrollView.backgroundColor = UIColor.gray
        
        scrollView.frame = CGRect.init(x: 50, y: 100, width: 300, height: 120)
        //scrollView.alwaysBounceHorizontal = true
        scrollView.isPagingEnabled = true
        
        self.view.addSubview(scrollView)
        
        
        let view : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 240, height: 120))
        view.backgroundColor = UIColor.blue
        scrollView.addSubview(view)
        
        let view3 : UIView = UIView.init(frame: CGRect.init(x: 60, y: 0, width: 240, height: 120))
        view3.backgroundColor = UIColor.yellow
        scrollView.addSubview(view3)
        
        let view2 : UIView = UIView.init(frame: CGRect.init(x: 30, y: 0, width: 240, height: 120))
        view2.backgroundColor = UIColor.green
        scrollView.addSubview(view2)
        
        
        
    }
}
