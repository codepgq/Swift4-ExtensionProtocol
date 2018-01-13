//
//  ViewController.swift
//  ExtensionProtocol
//
//  Created by pgq on 2018/1/13.
//  Copyright © 2018年 pgq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let data = Data(bytes: [0x2,0x33,0x54,0x78,0x1,0x2d,0x3a,0x5b,0x1,0x2d,0x3a,0x5b,0x1,0x2d,0x3a,0x5b])
    let color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)

    @IBAction func toHexBtnClick(_ sender: Any) {
        print(data.pq.toHex())
    }
    @IBAction func toUInt8BtnClick(_ sender: Any) {
        print(data.pq.toUInt8())
    }
    @IBAction func redBtnClick(_ sender: Any) {
        print(color.pq.red())
    }
    @IBAction func greenBtnClick(_ sender: Any) {
        print(color.pq.green())
    }
    @IBAction func blueBtnClick(_ sender: Any) {
        print(color.pq.blue())
    }
}


