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
    
    lazy var btnBack : UIButton = UIButton.init()
    lazy var labelTitle : UILabel = UILabel.init()
    lazy var btnShare : UIButton = UIButton.init()
    lazy var viewMidNavMenu : UIView = UIView.init()
    lazy var bIsMove : Bool = false
    var listView : HeadLineTableView?
    
    
    override func viewDidLoad() {
        
        initView()
        buildTableView()
    }
    
    func initView() {
        
        initTopNavBar()
        initMidNavMenu()
        
    }
    
    func initTopNavBar() {
        
        let topNavBgView : UIView = UIView.init(frame:CGRect.init(x: CGFloat(0), y: CGFloat(20), width: getScreenSize().width, height: CGFloat(45)))
        self.view.addSubview(topNavBgView)
        
        btnBack.setImage(UIImage.init(named: "ic_nav_return_normal"), for: .normal)
        btnBack.imageView?.contentMode = .scaleAspectFill
        btnBack.tag = 11
        btnBack.addTarget(self, action: #selector(HeadLineVC.onClick(button:)), for: .touchUpInside)
        //btnBack.backgroundColor = UIColor.green
        topNavBgView.addSubview(btnBack)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.snp.makeConstraints(){(make) -> Void in
            
            make.leading.equalTo(topNavBgView).offset(10)
            make.centerY.equalTo(topNavBgView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        
        }
        
        labelTitle.text = "金钟*国际金融中心"
        labelTitle.font = UIFont.systemFont(ofSize: 16)
        labelTitle.textAlignment = .center
        topNavBgView.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        labelTitle.snp.makeConstraints(){(make) -> Void in
            
            make.leading.equalTo(topNavBgView).offset(60)
            make.centerY.equalTo(topNavBgView)
            make.trailing.equalTo(topNavBgView).offset(-60)
            
        }
        
        
        btnShare.setImage(UIImage.init(named: "xf_ic_share_gray"), for: .normal)
        btnShare.imageView?.contentMode = .scaleAspectFill
        btnShare.tag = 12
        btnShare.addTarget(self, action: #selector(HeadLineVC.onClick(button:)), for: .touchUpInside)
       
        topNavBgView.addSubview(btnShare)
        btnShare.translatesAutoresizingMaskIntoConstraints = false
        btnShare.snp.makeConstraints(){(make) -> Void in
        
            make.centerY.equalTo(topNavBgView)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.trailing.equalTo(topNavBgView).offset(-10)
            
        }
        

        
    }
    
    func initMidNavMenu(){
        
        viewMidNavMenu.frame = CGRect.init(x: CGFloat(0), y: CGFloat(70), width: getScreenSize().width, height: CGFloat(50))
        //viewMidNavMenu.backgroundColor = UIColor.brown
        self.view.addSubview(viewMidNavMenu)
        
        
        //初始菜单标签
        buildNavMenu(items: Array.init(arrayLiteral: "楼盘","户型","评价","详情"), parentView: viewMidNavMenu)
    }
    
    func buildNavMenu(items: Array<String>,parentView : UIView) {
        
        if items.count <= 0 {
        
            return
        }
        
        let itemWidth : CGFloat = getScreenSize().width / CGFloat(items.count)
        
        for (idx,item) in items.enumerated(){
        
            let button : UIButton = UIButton.init(frame: CGRect.init(x: CGFloat(idx) * itemWidth, y: 0, width: itemWidth, height: 45))
            button.setTitle(item, for: .normal)
            button.tag = idx + 1
            if(idx + 1 == 1){
    
                button.setTitleColor(UIColor.init(red: 221 / 255, green: 106 / 255, blue: 81 / 255, alpha: 1.0), for: .normal)
            }else{
            
                button.setTitleColor(UIColor.black, for: .normal)
            }
            
            //button.backgroundColor = UIColor.init(red: CGFloat((23 * idx) / 255), green: CGFloat(13 * idx / 255), blue: CGFloat(36 * idx / 255), alpha: 1.0)
            button.addTarget(self, action: #selector(HeadLineVC.onClick(button:)), for: .touchUpInside)
            parentView.addSubview(button)
            
        }
        
        let bottomLine : UIView = UIView.init(frame: CGRect.init(x: (itemWidth - 50) / 2, y: 46, width: 50, height: 5))
        bottomLine.tag = 10
        bottomLine.backgroundColor = UIColor.init(red: 221 / 255, green: 106 / 255, blue: 81 / 255, alpha: 1.0)
        bottomLine.layer.cornerRadius = 2.5
        parentView.addSubview(bottomLine)
        
    }
    
    func onClick(button : UIButton) {
        
        if button.tag > 4 {
            return
        }
        
        if let bottomLineView = viewMidNavMenu.viewWithTag(10){
        
            moveAnim(view: bottomLineView, targetPos: CGPoint.init(x: button.x() + (button.width() - 50) / 2 , y: button.y()))
        }
        
        updateLabelStatus(idx: button.tag)
        
    }
    
    func updateLabelStatus(idx : Int) {
        
        for i in 1..<5 {
            
            if(i == idx){
                
                (viewMidNavMenu.viewWithTag(i)! as! UIButton).setTitleColor(UIColor.init(red: 221 / 255, green: 106 / 255, blue: 81 / 255, alpha: 1.0), for: .normal)
                
            }else{
                
                (viewMidNavMenu.viewWithTag(i)! as! UIButton).setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    func moveAnim(view : UIView, targetPos : CGPoint){
        
        if view.x() == targetPos.x || bIsMove{
            return
        }
        
        bIsMove = true
        UIView.animate(withDuration: 0.3,
                       
                       animations: {
                        
                        view.setX(x: targetPos.x)
        
        },
                       
                       completion: {(Bool) -> Void in
                        
                        self.bIsMove = false
        })
        
    }
    
    func buildTableView() {
        
        listView = HeadLineTableView.init(frame:CGRect(x : 0, y : 120,width: self.view.frame.width, height: self.view.frame.height - 190))
        listView!.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10)
        listView!.tableFooterView = UIView(frame:CGRect.zero)
        listView!.addObserver(self, forKeyPath: "contentOffset", options: [.new,.old], context: nil)
        self.view.addSubview(listView!)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentOffset"{
            
            let offset : CGPoint = change![NSKeyValueChangeKey.newKey] as! CGPoint
            let offsetY : CGFloat = offset.y
            
        
            if(offsetY >= 0 && offsetY <= 50){
                
                moveAnim(view: viewMidNavMenu.viewWithTag(10)!, targetPos: CGPoint.init(x: (viewMidNavMenu.viewWithTag(1)?.x())! + ((viewMidNavMenu.viewWithTag(1)?.width())! - 50) / 2 ,
                                                                                        y: (viewMidNavMenu.viewWithTag(1)?.y())!))
                updateLabelStatus(idx : 1)

            }
            
            if(offsetY >= 180 * 2 + 50 && offsetY <= 180 * 2 + 50 + 50){
                
                moveAnim(view: viewMidNavMenu.viewWithTag(10)!,
                         targetPos: CGPoint.init(x: (viewMidNavMenu.viewWithTag(2)?.x())! + ((viewMidNavMenu.viewWithTag(2)?.width())! - 50) / 2 ,
                                                                                        y: (viewMidNavMenu.viewWithTag(2)?.y())!))
                updateLabelStatus(idx : 2)
            }
            if(offsetY >= (180 * 2 + 50) * 2 && offsetY <= (180 * 2 + 50) * 2 + 50){
                
                moveAnim(view: viewMidNavMenu.viewWithTag(10)!,
                         targetPos: CGPoint.init(x: (viewMidNavMenu.viewWithTag(3)?.x())! + ((viewMidNavMenu.viewWithTag(3)?.width())! - 50) / 2 ,
                                                 y: (viewMidNavMenu.viewWithTag(3)?.y())!))
                updateLabelStatus(idx : 3)
            }
            if(offsetY >= (180 * 2 + 50) * 3 && offsetY <= (180 * 2 + 50) * 3 + 50){
                
                moveAnim(view: viewMidNavMenu.viewWithTag(10)!,
                         targetPos: CGPoint.init(x: (viewMidNavMenu.viewWithTag(4)?.x())! + ((viewMidNavMenu.viewWithTag(4)?.width())! - 50) / 2 ,
                                                 y: (viewMidNavMenu.viewWithTag(4)?.y())!))
                updateLabelStatus(idx : 4)
            }
            
            
        }
        
    }
    
    deinit {
        listView?.removeObserver(self, forKeyPath: "contentOffset", context: nil)
    }

    
}
