//
//  BaseObjPool.swift
//  MoreHouse
//
//  Created by 刘小兵 on 2017/10/19.
//  Copyright © 2017年 刘小兵. All rights reserved.
//

import Foundation

/// 规范对象池接口--使用关联对象类型
protocol ObjPoolListener {
    
    associatedtype objType
    
    func create() -> objType                    //创建对象
    
    func validate(obj : objType?) -> Bool        //验证对象的有效性
    
    func recycObj(var obj : inout objType?)      //回收对象
    
    func getObjFromPool() -> objType            //从对象中取对象
    
    func putObj2Pool(var obj: inout objType?)              //将对象放回对象池
    
    
}


class BaseObjPool<T>: NSObject,ObjPoolListener {
    
    
    typealias objType = T       //将对象进行关联
    
    
    lazy var inUserList : NSMutableArray = NSMutableArray.init()
    lazy var availableList : NSMutableArray = NSMutableArray.init()
    
    
    override init() {
        
    }
    
    
    /***********************implements protocol ******************/
    
    func getObjFromPool() -> T {
        
        var t :T?
        
        if self.availableList.count > 0 {
            
            for obj in self.availableList{
                
                t = (obj as! T)
                
                self.availableList.remove(t!)
                self.inUserList.add(t!)
                break;
                
            }
            
        }else{
            
            t = create() as? T
            self.inUserList.add(t!)
            
        }
        
        return t!
    }
    
    
    func putObj2Pool(var obj: inout T?) {
        
        guard obj != nil else{
            
            return
        }
        
        self.inUserList.remove(obj!)
        
        if validate(obj: obj){
            
            self.availableList.add(obj!)
            
        }else{
            
            recycObj(obj: &obj)
            
        }
        
    }
    
    func recycObj(var obj: inout T?) {
        
        obj = nil
    }
    
    func validate(obj: T?) -> Bool {
        
        return obj != nil
    }
    
    
    func create() -> T {
        
        return NSObject.init() as! T
    }
    
    
}
