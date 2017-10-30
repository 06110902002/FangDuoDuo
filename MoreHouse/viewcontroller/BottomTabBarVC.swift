//
//  BottomTabBarVC.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/17.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class BottomTabBarVC: UITabBarController,UITabBarControllerDelegate {
    
    lazy var homeVC : HomeVC = HomeVC()
    
    lazy var headLineVC: HeadLineVC = HeadLineVC()
    
    lazy var msgVC : MsgVC = MsgVC()
    
    lazy var focusVC : FocusVC = FocusVC()
    
    lazy var mineVC : MineVC = MineVC()
    
    override func viewDidLoad() {
        
        initMenu()
    }
    
    func initMenu() {
        
        self.view.backgroundColor = UIColor.white
        
        self.delegate = self as UITabBarControllerDelegate;
        
        self.homeVC.tabBarItem.title = "首页"
        self.homeVC.view.tag = 0
        var homeChkedImg : UIImage = UIImage.init(named: "ic_buy_house_pressed")!
        homeChkedImg = homeChkedImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        homeChkedImg = homeChkedImg.withRenderingMode(.alwaysOriginal)
        self.homeVC.tabBarItem.selectedImage = homeChkedImg
        
        var homeNormalImg : UIImage = UIImage.init(named: "ic_buy_house_normal")!
        homeNormalImg = homeNormalImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        homeNormalImg = homeNormalImg.withRenderingMode(.alwaysOriginal)
        self.homeVC.tabBarItem.image = homeNormalImg
        
        self.headLineVC.tabBarItem.title = "头条"
        self.headLineVC.view.tag = 1
        var headlineChkedImg : UIImage = UIImage.init(named: "ic_head_line_pressed")!
        headlineChkedImg = headlineChkedImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        headlineChkedImg = headlineChkedImg.withRenderingMode(.alwaysOriginal)
        self.headLineVC.tabBarItem.selectedImage = headlineChkedImg
        var headlineNormalImg : UIImage = UIImage.init(named: "ic_head_line_normal")!
        headlineNormalImg = headlineNormalImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        headlineNormalImg = headlineNormalImg.withRenderingMode(.alwaysOriginal)
        self.headLineVC.tabBarItem.image = headlineNormalImg
        
        
        self.msgVC.tabBarItem.title = "消息"
        self.msgVC.view.tag = 2
        var msgChkedImg : UIImage = UIImage.init(named: "ic_message_list_pressed")!
        msgChkedImg = msgChkedImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        msgChkedImg = msgChkedImg.withRenderingMode(.alwaysOriginal)
        self.msgVC.tabBarItem.selectedImage = msgChkedImg
        var msgNormalImg : UIImage = UIImage.init(named: "ic_message_list_normal")!
        msgNormalImg = msgNormalImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        msgNormalImg = msgNormalImg.withRenderingMode(.alwaysOriginal)
        self.msgVC.tabBarItem.image = msgNormalImg
        
        
        self.focusVC.tabBarItem.title = "关注"
        self.focusVC.view.tag = 3
        var focusChkedImg : UIImage = UIImage.init(named: "ic_tab_focus_selected")!
        focusChkedImg = focusChkedImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        focusChkedImg = focusChkedImg.withRenderingMode(.alwaysOriginal)
        self.focusVC.tabBarItem.selectedImage = focusChkedImg
        var focusNormalImg : UIImage = UIImage.init(named: "ic_tab_focus_unselected")!
        focusNormalImg = focusNormalImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        focusNormalImg = focusNormalImg.withRenderingMode(.alwaysOriginal)
        self.focusVC.tabBarItem.image = focusNormalImg

        
        self.mineVC.tabBarItem.title = "我"
        self.mineVC.view.tag = 4
        var mineChkedImg : UIImage = UIImage.init(named: "ic_me_pressed")!
        mineChkedImg = mineChkedImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        mineChkedImg = mineChkedImg.withRenderingMode(.alwaysOriginal)
        self.mineVC.tabBarItem.selectedImage = mineChkedImg
        var mineNormalImg : UIImage = UIImage.init(named: "ic_me_normal")!
        mineNormalImg = mineNormalImg.reSizeImage(reSize: CGSize.init(width: 30, height: 30))
        mineNormalImg = mineNormalImg.withRenderingMode(.alwaysOriginal)
        self.mineVC.tabBarItem.image = mineNormalImg
        
        
        self.viewControllers = [self.homeVC,self.headLineVC,self.msgVC,self.focusVC,self.mineVC];
    }
    
    /// 更新底部菜单项的右上角红点提示
    ///
    /// - Parameters:
    ///   - index: 底部菜单项的索引
    ///   - withCount: 红点数
    func updateTips(index : Int, count: Int) {
        
        switch index {
        case 0:
            
            if(count == 0){
                
                self.homeVC.tabBarItem.badgeValue = nil
                return
            }
            self.homeVC.tabBarItem.badgeValue = String(count)
            self.homeVC.tabBarItem.badgeColor = UIColor.red
            break;
            
        case 1:
            
            if(count == 0){
                
                self.headLineVC.tabBarItem.badgeValue = nil
                return
            }
            
            self.headLineVC.tabBarItem.badgeValue = String(count)
            self.headLineVC.tabBarItem.badgeColor = UIColor.red
            
            break;
            
        case 2:
            
            if(count == 0){
                
                self.msgVC.tabBarItem.badgeValue = nil
                return
            }
            
            self.msgVC.tabBarItem.badgeValue = String(count)
            self.msgVC.tabBarItem.badgeColor = UIColor.red
            
            break;
            
        case 3:
            
            if(count == 0){
                
                self.focusVC.tabBarItem.badgeValue = nil
                return
            }
            
            self.focusVC.tabBarItem.badgeValue = String(count)
            self.focusVC.tabBarItem.badgeColor = UIColor.red
            
            break;
        
        case 4:
            
            if(count == 0){
                
                self.mineVC.tabBarItem.badgeValue = nil
                return
            }
            
            self.mineVC.tabBarItem.badgeValue = String(count)
            self.mineVC.tabBarItem.badgeColor = UIColor.red
            
            break;
            
        default:
            
            break;
            
        }
        
    }
    
    
    //implements 实现协议接口
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        updateTips(index: viewController.view.tag, count: 0)
    }


    
}
