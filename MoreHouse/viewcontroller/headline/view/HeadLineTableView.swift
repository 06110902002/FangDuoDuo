//
//  HeadLineTableView.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/11/1.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation
import UIKit


/// 头条列表
class HeadLineTableView: BaseTableView {
    
    
    override func initAttr() {
        super.initAttr()
        initData()
        
    }
    
    func initData() {
        

        //添加橡盘标题
        let buildData : BuildingTitleModel = BuildingTitleModel.init()
        buildData.title = "热门楼盘"
        self.dataList?.append(buildData)
        
        
        //楼盘信息1
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
        
        //楼盘信息2
        var houseDataList2 : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 6{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "title_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            houseDataList2.append(itemData)
            
        }
        let houseGroupData2 : HomeHouseGroupModel = HomeHouseGroupModel.init()
        houseGroupData2.houseGroupItemList.append(contentsOf: houseDataList2)
        self.dataList?.append(houseGroupData2)

        
        
        
        //添加户型橡盘标题
        let houseType : BuildingTitleModel = BuildingTitleModel.init()
        houseType.title = "户型"
        self.dataList?.append(houseType)
        
        
        //户型信息
        var houseTypeDataList : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 6{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "户型_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            houseTypeDataList.append(itemData)
            
        }
        let houseTypeGroupData : HomeHouseGroupModel = HomeHouseGroupModel.init()
        houseTypeGroupData.houseGroupItemList.append(contentsOf: houseTypeDataList)
        self.dataList?.append(houseTypeGroupData)
        
         //户型信息2
        var houseTypeDataList2 : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 6{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "户型_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            houseTypeDataList2.append(itemData)
            
        }
        let houseTypeGroupData2 : HomeHouseGroupModel = HomeHouseGroupModel.init()
        houseTypeGroupData2.houseGroupItemList.append(contentsOf: houseTypeDataList2)
        self.dataList?.append(houseTypeGroupData2)
        
        
        
        //添加评价标题
        
        for i in 0..<1 {
        
            let pinjiaData : BuildingTitleModel = BuildingTitleModel.init()
            pinjiaData.title = String.init(format: "评价_%d", i)
            self.dataList?.append(pinjiaData)
        }
        
        
        //评价信息
        var pinjiaDataList : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 16{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "评价_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            pinjiaDataList.append(itemData)
            
        }
        let pinjiaTypeGroupData : HomeHouseGroupModel = HomeHouseGroupModel.init()
        pinjiaTypeGroupData.houseGroupItemList.append(contentsOf: pinjiaDataList)
        self.dataList?.append(pinjiaTypeGroupData)
        
        //评价信息2
        var pinjiaDataList2 : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 16{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "评价_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            pinjiaDataList2.append(itemData)
            
        }
        let pinjiaTypeGroupData2 : HomeHouseGroupModel = HomeHouseGroupModel.init()
        pinjiaTypeGroupData2.houseGroupItemList.append(contentsOf: pinjiaDataList2)
        self.dataList?.append(pinjiaTypeGroupData2)
        
        //评价信息3
        var pinjiaDataList3 : Array<HomeHouseGroupItemModel> = Array<HomeHouseGroupItemModel>.init()
        
        for j in 0 ..< 16{
            
            let itemData : HomeHouseGroupItemModel = HomeHouseGroupItemModel.init()
            itemData.title = String.init(format: "评价_%d", j)
            itemData.abstract = String.init(format: "abstract_%d", j)
            
            pinjiaDataList3.append(itemData)
            
        }
        let pinjiaTypeGroupData3 : HomeHouseGroupModel = HomeHouseGroupModel.init()
        pinjiaTypeGroupData3.houseGroupItemList.append(contentsOf: pinjiaDataList3)
        self.dataList?.append(pinjiaTypeGroupData3)
        
    }
    
    
    //override 达到展现不同的视图
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let baseModel  : BaseModel = self.dataList![indexPath.row];
        
        var cell  : BaseTabViewCell?
        
        switch (baseModel.getItemType()) {
            
        case .buildingTitleType:
            
            cell = BuildingTitleCell(style:UITableViewCellStyle.default, reuseIdentifier : "BuildingTitleCell")
            
            break;
        
        case .houseGroupType:
            
            cell = HomeHouseGroupCell(style:UITableViewCellStyle.default, reuseIdentifier : "HomeHouseGroupCell")
            
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
            
       
        case .houseGroupType:
            height = 180
            break;
            

            
        case .buildingTitleType:
            height = 50
            break;
            
            
        default:
            height = 100
            break;
        }
        
        return height;
        
    }

    
}
