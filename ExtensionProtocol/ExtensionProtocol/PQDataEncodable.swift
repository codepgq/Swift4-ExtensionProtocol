//
//  PQDataProtocol.swift
//  ExtensionProtocol
//
//  Created by pgq on 2018/1/13.
//  Copyright © 2018年 pgq. All rights reserved.
//

import Foundation

protocol PQDataEncodable {
    /// 关联类型
    associatedtype WarpperType
    /// 这个就是命名，我这里使用pq，你可以使用你的，比如：SnapKit，他的就是 view.snp.XXXX
    var pq: WarpperType { get }
}

struct ExtensionPQDataEncodable<T>: PQDataEncodable {
    /// T 泛型
    let pq: T
    /// 构造方法
    init(pq: T) {
        self.pq = pq
    }
}

/// 这里指定 WrapperType 是 Data，所以在 PQDataEncodable 中的 pq 就是 Data 类型了
extension PQDataEncodable where WarpperType == Data {
    /// 方法名 返回参数
    func toUInt8() -> [UInt8]{
        /// 根据数组长度，创建数组
        var bytes = [UInt8](repeating: 0, count: pq.count)
        /// 把 Data 的 Bytes 拷贝到 数组中
        pq.copyBytes(to: &bytes, count: pq.count)
        /// 返回数组
        return bytes
    }
    
    func toHex() -> String {
        /// 创建一个字符串
        var hex: String = ""
        /// 遍历数组，在转换为16进制添加到字符串中
        for i in 0..<toUInt8().count {
            hex.append(NSString(format: "%02x", pq[i]) as String)
            /// 长度为4就添加一个空格， 格式化字符串
            if (i + 1) % 4 == 0 { hex.append(" ") }
        }
        /// 返回字符串
        return hex
    }
}

extension Data {
    var pq: ExtensionPQDataEncodable<Data> {
        return ExtensionPQDataEncodable(pq: self)
    }
}
