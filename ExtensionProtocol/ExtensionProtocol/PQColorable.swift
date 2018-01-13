//
//  PQColorable.swift
//  ExtensionProtocol
//
//  Created by pgq on 2018/1/13.
//  Copyright © 2018年 pgq. All rights reserved.
//

import UIKit

/// 新建一个协议
protocol PQColorable {
    /// 关联类型
    associatedtype WarpperType
    var pq: WarpperType { get }
}

/// 定义一个类
final class ExtensionPQColorable<T>: PQColorable {
    /// 泛型
    let pq: T
    /// 构造方法
    init(pq: T) {
        self.pq = pq
    }
}

/// 为协议实现默认方法
extension PQColorable where WarpperType == UIColor{
    /// 获取红色
    func red() -> CGFloat {
        var value: CGFloat = 0
        pq.getRed(&value, green: nil, blue: nil, alpha: nil)
        return value
    }
    /// 获取绿色
    func green() -> CGFloat {
        var value: CGFloat = 0
        pq.getRed(nil, green: &value, blue: nil, alpha: nil)
        return value
    }
    /// 获取蓝色
    func blue() -> CGFloat {
        var value: CGFloat = 0
        pq.getRed(nil, green: nil, blue: &value, alpha: nil)
        return value
    }
}


extension UIColor{
    var pq: ExtensionPQColorable<UIColor>{
        return ExtensionPQColorable(pq: self)
    }
}
