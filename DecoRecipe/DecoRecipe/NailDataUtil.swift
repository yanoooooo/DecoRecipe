//
//  NailDataUtil.swift
//  DecoRecipe
//
//  Created by Yoko on 2015/06/06.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import Foundation

class NailDataUtil: NSObject {
    // テストメッセージ出力用
    var message = "シングルトン"
    //NSUserDefaultsのインスタンスを生成
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    //こでだけせ生成
    // singleton in Swift 1.2
    static let sharedController = NailDataUtil()
    
    //データ用の配列を生成
    var recipiSizde: Int = 0
    
    
    //plistからデータを取り出す関数
    func getPlistData()
    {
        // データを用意して保存
        let itemData = ["マニュキュア":"シャネル","筆":"細め"]
        let saveData = ["name": "フレンチネイル", "description": "初心者おすすめ！", "image": "nail01.jpg","item":itemData]
        defaults.setObject(saveData, forKey: "recipi1")
        defaults.synchronize()
        
        let key = "recipi1"
        // 再度読み出し
        if let readDict = defaults.objectForKey(key) as? [String: String] {
            let readData2: String! = readDict["name"]
            let readData3: String! = readDict["description"]
            let readData4: String! = readDict["image"]
            let readData5: String! = readDict["item"]
            println("Data of key2 = (readData2)")
            println("result : " + readData2)
            println("Data of key3 = (readData3)")
            println("Data of key4 = (readData4)")
            println("Data of key5 = (readData5)")
        } else {
            println("No such Data")
        }
    
        if let name = defaults.dictionaryForKey("data0")
        {
            println(name)
            if let job = name["item"] {
                println(job["マニュキュア"])
            }

        }
        
    }
    
    
    
}
