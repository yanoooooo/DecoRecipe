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
        let f: Float = Float(100)
        let recipi1 = ["image":"nail0.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]
        let recipi2 = ["image":"nail1.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]
        let recipi3 = ["image":"nail2.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]

        
        let recipi = ["1":recipi1,"2":recipi2,"3":recipi3]
        let saveData = ["name": "フレンチネイル", "description": "初心者おすすめ！", "image": "nail01.jpg","item":itemData,"recipi":recipi]
        defaults.setObject(saveData, forKey: "data0")
        defaults.synchronize()
        
        let key = "data0"
        // 再度読み出し
        /*if let readDict = defaults.objectForKey(key) as? [String: String] {
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
        }*/
    
        if let name = defaults.dictionaryForKey("data0")
        {
            println(name)
            if let job = name["item"] {
                println(job["マニュキュア"])
            }
            
            if let job = name["recipi"] {
                println(job["1"])
            }

        }
        
    }
    
    
    
    
    
    
    
}
