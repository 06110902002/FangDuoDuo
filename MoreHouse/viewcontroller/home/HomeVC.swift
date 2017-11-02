//
//  HomeVC.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/17.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeVC: BaseVC {
    
    lazy var headView : UIImageView = UIImageView.init()
    var headerHeightConstraint : NSLayoutConstraint?
    let headerHeight : CGFloat = 200
    lazy var btnLocation : UIButton = UIButton.init()
    lazy var btnSearch : UIButton = UIButton.init()
    var labelWidthConstraint : NSLayoutConstraint?
    let fBtnSearchHeight : CGFloat = 50
    let labelMinWidth : CGFloat = 300
    let segmentMiniTopInset : CGFloat = 0
    var listView : UITableView?
    lazy var locationSearchBgView : UIView = UIView.init()
    
    
    override func viewDidLoad() {
        
        setStatusBarBackground(color: UIColor.init(red: 125 / 255, green: 126 / 255, blue: 121 / 255, alpha: 1.0))
        setStatusFontStyle(style: UIStatusBarStyle.lightContent)
        
        buildListView()
        initView()
        
    }
    
    func initView()  {
        
        
        headView.image = UIImage.init(named: "headbg.jpg")
        headView.contentMode = .scaleAspectFill
        self.view.addSubview(headView)
    
        //添加定位与搜索背景视图，主要用于当滚动列表滚动到顶端时状态发生变化的表现
        locationSearchBgView.backgroundColor = UIColor.white
        locationSearchBgView.frame = CGRect.init(x: 0, y: 20, width: getScreenSize().width, height: 90)
        locationSearchBgView.alpha = 0.0
        self.view.addSubview(locationSearchBgView)
        

        headView.translatesAutoresizingMaskIntoConstraints = false
        headView.isUserInteractionEnabled = false;
        
        //添加高度约束
        headerHeightConstraint = NSLayoutConstraint.init(item: headView,
                                                         attribute:NSLayoutAttribute.height,
                                                         relatedBy:.equal,
                                                         toItem: nil,
                                                         attribute: NSLayoutAttribute(rawValue: 0)!,
                                                         multiplier: 1,
                                                         constant: headerHeight)
        
        headView.addConstraint(headerHeightConstraint!)
        
        
        //添加左边约束
        self.view.addConstraint(NSLayoutConstraint.init(item: headView,
                                                        attribute:NSLayoutAttribute.left,
                                                        relatedBy:.equal,
                                                        toItem: self.view,
                                                        attribute: .left,
                                                        multiplier: 1,
                                                        constant: 0))
        
        //添加右边约束
        self.view.addConstraint(NSLayoutConstraint.init(item: headView,
                                                        attribute:.right,
                                                        relatedBy:.equal,
                                                        toItem: self.view,
                                                        attribute: .right,
                                                        multiplier: 1,
                                                        constant: 0))
        
        //添加顶部约束
        self.view.addConstraint(NSLayoutConstraint.init(item: headView,
                                                        attribute:.top,
                                                        relatedBy:.equal,
                                                        toItem: self.view,
                                                        attribute: .top,
                                                        multiplier: 1,
                                                        constant: 13))
        

        
        
        //初始定位按钮
        btnLocation.layer.cornerRadius = 20
        btnLocation.backgroundColor = UIColor.init(red: 55 / 255, green: 48 / 255, blue: 40 / 255, alpha: 0.5)
        btnLocation.setTitle("衡阳", for: .normal)
        btnLocation.contentHorizontalAlignment = .left
        btnLocation.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0)
        btnLocation.tag = 21
        btnLocation.addTarget(self, action: #selector(HomeVC.onClick), for: .touchUpInside)
        
        self.view.addSubview(btnLocation)
        btnLocation.translatesAutoresizingMaskIntoConstraints = false
        
        //使用尾随闭包设置约束
        btnLocation.snp.makeConstraints(){(make) -> Void in
            
            make.width.equalTo(90)
            make.leading.equalTo(20)
            make.top.equalTo(55)
            make.height.equalTo(40)
        }
        
        
        
        //画按钮右边三角形
        let btnArrowDownLayer : CALayer = CALayer.init()
        btnArrowDownLayer.bounds = CGRect.init(x: 0, y: 0, width: 15, height: 15)
        btnArrowDownLayer.position = CGPoint.init(x: 70, y: 15)
        btnArrowDownLayer.delegate = self as? CALayerDelegate
        btnArrowDownLayer.setNeedsDisplay()
        btnLocation.layer.addSublayer(btnArrowDownLayer)
        
        //初始搜索按钮
        btnSearch.layer.cornerRadius = 25
        //btnSearch.layer.masksToBounds = true
        btnSearch.backgroundColor = UIColor.white
        btnSearch.tag = 22
        btnSearch.layer.shadowOffset =  CGSize.init(width: 5, height: 5)
        btnSearch.layer.shadowOpacity = 0.8;
        btnSearch.layer.shadowColor =  UIColor.black.cgColor
        btnSearch.addTarget(self, action: #selector(HomeVC.onClick), for: .touchUpInside)
        self.view.addSubview(btnSearch)
        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        
        //添加宽度约束
        labelWidthConstraint = NSLayoutConstraint.init(item: btnSearch,
                                                       attribute: .width,
                                                       relatedBy: .equal,
                                                       toItem: nil,
                                                       attribute: .width,
                                                       multiplier: 1,
                                                       constant: getScreenSize().width - 40)
        btnSearch.addConstraint(labelWidthConstraint!)
        
        //添加顶部约束
        self.view.addConstraint(NSLayoutConstraint.init(item: btnSearch,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: headView,
                                                        attribute: .bottom,
                                                        multiplier: 1,
                                                        constant: -fBtnSearchHeight / 2))
        
        //添加右边约束
        self.view.addConstraint(NSLayoutConstraint.init(item: btnSearch,
                                                        attribute: .right,
                                                        relatedBy: .equal,
                                                        toItem: self.view,
                                                        attribute: .right,
                                                        multiplier: 1,
                                                        constant: -20))
        
        btnSearch.addConstraint(NSLayoutConstraint.init(item: btnSearch,
                                                        attribute: .height,
                                                        relatedBy: .equal,
                                                        toItem: nil,
                                                        attribute: .height,
                                                        multiplier: 1,
                                                        constant: fBtnSearchHeight))
        
        //添加搜索按钮中的图标
        let searchImg : UIImageView = UIImageView.init(frame: CGRect.init(x: 20, y: 12.5, width: 25, height: 25))
        searchImg.image = UIImage.init(named: "ic_search_gray3")
        searchImg.contentMode = .scaleAspectFill
        btnSearch.addSubview(searchImg)
        
        //添加搜索内容编辑框
        let searchEdit : UITextField = UITextField.init(frame: CGRect.init(x: 55, y: 5, width: getScreenSize().width - 80, height: 40))
        searchEdit.placeholder = "请输入楼盘名"
        btnSearch.addSubview(searchEdit)
        
    }
    
    func buildListView() {
        
        listView = HomeTableView.init(frame:CGRect(x : 0, y : 20,width: self.view.frame.width, height: self.view.frame.height - 80))
        listView!.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10)
        listView!.tableFooterView = UIView(frame:CGRect.zero)
        listView!.addObserver(self, forKeyPath: "contentOffset", options: [.new,.old], context: nil)
        self.view.addSubview(listView!)
        
        
    }
    
    func buildHouseHeadLine(){
        
    }
    
    func onClick(button:UIButton) {
        
        print("92-------------:\(button.tag)")
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentOffset"{
            
            let offset : CGPoint = change![NSKeyValueChangeKey.newKey] as! CGPoint
            let offsetY : CGFloat = offset.y
            
            let oldOffset : CGPoint = change![NSKeyValueChangeKey.oldKey] as! CGPoint
            let oldOffsetY : CGFloat = oldOffset.y
            
            let deltaOfOffsetY : CGFloat = offsetY - oldOffsetY
            
            //print("203---------------deltaOfOffsetY:  \(deltaOfOffsetY)   offsetY:  \(offsetY)")
            
            
            if deltaOfOffsetY < 0 && offsetY < 0 {      //单纯向下滑
            
                //print("208-----------: down")
                
//                if ((self.headerHeightConstraint?.constant)! >= self.headerHeight) {
//                    
//                    self.headerHeightConstraint?.constant = self.headerHeight;
//                    
//                } else {
//                    
//                    self.headerHeightConstraint?.constant -= deltaOfOffsetY;
//                    
//                }
            
            }
            
            if (deltaOfOffsetY > 0 && offsetY < 0){      //单纯向下拉，然后向上回弹
            
                    //print("224-----------: down---up")
               
            }
            
            if(deltaOfOffsetY > 0 && offsetY > 0 ){     //单纯向上滑
            
                 //print("229-----------: up")
                
                
                if ((self.headerHeightConstraint?.constant)! <= self.segmentMiniTopInset + 60) {
                    
                    self.headerHeightConstraint?.constant = self.segmentMiniTopInset + 60;
                    
                    
                }else{
                    
                    self.headerHeightConstraint?.constant -= deltaOfOffsetY;
                    
                }
                
                //调整UItableView的位置 ，防止出现空白,,当列表中的内容大于列表可见框的高度时，才调整列表的位置
//                if (listView?.contentSize.height)! > (getScreenSize().height - headerHeight){
//                    
//                    var frame : CGRect = (listView?.frame)!
//                    
//                    if frame.origin.y <= 63{
//                        
//                        frame.origin.y = 63
//                        
//                    }else{
//                        
//                        frame.origin.y -= deltaOfOffsetY
//                    }
//                    
//                    listView?.frame = frame
//                }
                
                
                //调整搜索框的宽度。达到缩放动画效果
                if (labelWidthConstraint?.constant)! <= 280{
                
                    labelWidthConstraint?.constant = 280
                    
                }else{
                    
                    labelWidthConstraint?.constant -= deltaOfOffsetY
                }
                
                //调整定位与搜索按钮的背景图透明度
                if locationSearchBgView.alpha <= 1.0 {
                
                    locationSearchBgView.alpha += 0.05
                }else{
                    locationSearchBgView.alpha = 1.0
                }
                
                
                //调整头部背景的透明度
                guard headView.alpha <= 0 else {
                    headView.alpha -= 0.025
                    return
                }
                headView.alpha = 0
            }
            
            if(deltaOfOffsetY < 0 && offsetY > 0 ){     //1.单纯向上滑,然后向下回弹  2.向下滑时--滚动视图有一部滑出了滚动视图，还未滑动到可视范围
            
                if offsetY > 200 { //2.向下滑时--滚动视图有一部滑出了滚动视图，还未滑动到可视范围
                
                }else{
                
                    if ((self.headerHeightConstraint?.constant)! >= self.headerHeight) {
                        
                        self.headerHeightConstraint?.constant = self.headerHeight;
                        
                    } else {
                        
                        self.headerHeightConstraint?.constant -= deltaOfOffsetY;
                        
                    }
                    
//                    var frame : CGRect = (listView?.frame)!
//                    
//                    if frame.origin.y >= 250{
//                        
//                        frame.origin.y = 250
//                        
//                    }else{
//                        
//                        frame.origin.y -= deltaOfOffsetY
//                    }
//                    
//                    listView?.frame = frame
                    
                    //调整搜索框的宽度。达到缩放动画效果
                    if (labelWidthConstraint?.constant)! >= getScreenSize().width - 40{
                        
                        labelWidthConstraint?.constant = getScreenSize().width - 40
                        
                    }else{
                        
                        labelWidthConstraint?.constant -= deltaOfOffsetY
                    }

                    //调整定位与搜索按钮的背景图透明度
                    if locationSearchBgView.alpha <= 0.0 {
                        
                        locationSearchBgView.alpha -= 0.2
                    }else{
                        locationSearchBgView.alpha = 0.0
                    }
                    
                    //调整头部背景的透明度
                    guard headView.alpha >= 0.9 else {
                        headView.alpha += 0.2
                        return
                    }
                    headView.alpha = 1.0
                
                }
                 //print("250-----------:up-------- down")
                
            }
            
        }
        
    }
    
    deinit {
        listView?.removeObserver(self, forKeyPath: "contentOffset", context: nil)
    }
}

extension HomeVC : CALayerDelegate{
    
    //图层画图
    func draw(_ layer: CALayer, in ctx: CGContext){
        
        ctx.setFillColor(UIColor.white.cgColor)
        //ctx.setStrokeColor(red: 12 / 255, green: 12 / 255, blue: 25 / 255, alpha: 1.0)
        ctx.setLineWidth(3)
        
        let p1 : CGPoint = CGPoint.init(x: 0, y: 8)
        
        let p2 : CGPoint = CGPoint.init(x: 7.5, y: 15)
        
        let p3 : CGPoint = CGPoint.init(x: 15, y: 8)
        
        ctx.addLines(between: [p1,p2,p3])
        ctx.closePath()
        ctx.drawPath(using: .fill)
        
    }
    
    
    
}
