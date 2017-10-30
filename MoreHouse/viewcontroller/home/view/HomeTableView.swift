//
//  HomeTableView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/18.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit

class HomeTableView: BaseTableView {
    
    
    override func initAttr() {
        super.initAttr()
        initData()
        
    }
    
    func initData() {
        
        let placeHolderData : PlaceHolderModel = PlaceHolderModel();
        self.dataList?.append(placeHolderData)
        
        let titles:[String] = ["新房","近期新房","地图找房","低价总盘","旅居地产"]
        let icons :[String] = ["ic_menu_01.png","ic_menu_02.png","ic_menu_03",
                               "ic_menu_04","ic_menu_05"]
        
        
        for i in 0 ..< 1  {
        
            let navMenuData : NavMenuModel = NavMenuModel()
            navMenuData.titles = titles
            navMenuData.icons = icons
            self.dataList?.append(navMenuData)
        }
        
        let houseHeadLineData : HouseHeadLineModel = HouseHeadLineModel.init()
        self.dataList?.append(houseHeadLineData)
        
        
        var houseDataList : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 6{
        
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "title_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
    
            houseDataList.append(itemData)
            
        }
        
        let houseGroupData : HomeHouseGroupModel = HomeHouseGroupModel.init()
        houseGroupData.houseGroupItemList.append(contentsOf: houseDataList)
        
        
        self.dataList?.append(houseGroupData)
        
        
        //添加滚动广告
        let advList : [String] = ["adv1.jpg","adv2.jpg","adv3.jpg","headbg.jpg"]
        
        let advData : AdvertisementModel = AdvertisementModel.init()
        advData.advList = advList
        self.dataList?.append(advData)
       
        
        
        
    }

    
    //override 达到展现不同的视图
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let baseModel  : BaseModel = self.dataList![indexPath.row];
        
        var cell  : BaseTabViewCell?
        
        switch (baseModel.getItemType()) {
            
        case .placeHolderType:
            
            cell = PlaceHolderCell(style:UITableViewCellStyle.default, reuseIdentifier : "PlaceHolderCell")
            break;
        
        case .navMenuType:
            
            cell = NavMenuCell(style:UITableViewCellStyle.default, reuseIdentifier : "NavMenuCell")
            break;
            
        case .houseHeadLineType:
            
             cell = HouseHeadLineCell(style:UITableViewCellStyle.default, reuseIdentifier : "HouseHeadLineCell")
             
            break;
            
        case .houseGroupType:
            
            cell = HomeHouseGroupCell(style:UITableViewCellStyle.default, reuseIdentifier : "HomeHouseGroupCell")
            
            break;
            
        case .advertisementType:
            
            cell = AdvertisementCell(style:UITableViewCellStyle.default, reuseIdentifier : "AdvertisementCell")
            
            break;
            
            
        default:
            
            break;
        }
        
        //print("94------------:\(indexPath.row * 20)")
        //cell!.bounds = CGRect.init(x: indexPath.row * 20, y: 0, width: 40, height: 40)
        
        cell!.bindData(data: baseModel)
        
        cell?.selectionStyle = .none    //点击时无背景色
        
        return cell!
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let baseModel : BaseModel = self.dataList![indexPath.row];
        var height :CGFloat = 0;
        
        switch (baseModel.getItemType()) {
          
        case .placeHolderType:
            height = 230
            break;
            
        case .navMenuType:
            height = 100
            break;
        
        case .houseHeadLineType:
            height = 50
            break;
            
        case .houseGroupType:
            height = 180
            break;
            
        case .advertisementType:
            height = 130
            break;
            
            
        default:
            height = 100
            break;
        }
        
        return height;
        
    }

    
}
