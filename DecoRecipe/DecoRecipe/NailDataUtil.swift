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
    
    //var recipiInfo: Dictionary = ["image":"","red":0.0,"green":0.0,"blue":0.0,"alpha":0.0]
    
    //plistからデータを取り出す関数
    func setPlistData()
    {
        // データを用意
        let itemData = ["name":"シャネル","price":"3000円","image":"ががががが"]
        let itemData2 = ["name":"ネイル工房オリジナルジェルネイルブラシ","price":"1000円","image":"ががががが"]
        let itemData3 = ["name":"ストーン","price":"500円","image":"ががががが"]
        let recipi1 = ["image":"nail0.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]
        let recipi2 = ["image":"nail1.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]
        let recipi3 = ["image":"nail2.jpg","red":0.0,"green":0.5,"blue":1.0,"alpha":1.0]
        
        //データ入れる
        let saveData = ["time":"30分","name": "MYM❤︎", "description": "初心者おすすめ！", "image": "nail0.jpg","nail":itemData,"fude":itemData2,"stone":itemData3,"recipi1":recipi1,"recipi2":recipi2,"recipi3":recipi3]
        let saveData2 = ["time":"500年","name": "フランス革命", "description": "革命を歌う！", "image": "nail1.jpg","nail":itemData,"fude":itemData2,"stone":itemData3,"recipi1":recipi1,"recipi2":recipi2,"recipi3":recipi3]
         let saveData3 = ["time":"40分","name": "インターネットワンダーランド", "description": "インターネットはワンダーランドだ！", "image": "nail2.jpg","nail":itemData,"fude":itemData2,"stone":itemData3,"recipi1":recipi1,"recipi2":recipi2,"recipi3":recipi3]
        defaults.setObject(saveData, forKey: "data0")
        defaults.setObject(saveData2, forKey: "data1")
        defaults.setObject(saveData3, forKey: "data2")
        defaults.synchronize()
        
    }
    
    /**
    *レシピデータを返す関数
    *param　データid 
    *param レシピnum
    *return image, red,blue,green,alpha    
    **/
    
    func getRecipiData( id : String ,recipiNum:String) -> (String, Float, Float, Float, Float){
        
        if let name = defaults.dictionaryForKey(id)
        {
        
            if let recipi = name[recipiNum]{
                var image:String = recipi["image"] as! String
                var alpha:Float = recipi["alpha"] as! Float
                var red:Float = recipi["red"] as! Float
                var blue:Float = recipi["blue"] as! Float
                var green:Float = recipi["green"] as! Float

                return (image, red,blue,green,alpha)
            }
        }
         return ("", 0, 0,0,0)
    }
    
    
    /**
    *ネイルデータを返す関数
    *param　データid
    *return nailName, nailImage,naildesc
    **/
    
    func getNailData(id : String)-> (name:String,image:String,desc:String)
    {
        if let data = defaults.dictionaryForKey(id)
        {
            var nailName:String = data["name"] as! String
            var nailImage:String = data["image"] as! String
            var naildesc:String = data["description"] as! String
            return (nailName, nailImage,naildesc)

        }
        return ("","","")
    }
    
    /**
    *ネイル詳細データを返す関数
    *param　データid
    *return nailName, nailImage,nailTime    
    **/
    
    func getNeilDetailData(id : String)-> (String,String,String)
    {
        if let data = defaults.dictionaryForKey(id)
        {
            var nailName:String = data["name"] as! String
            var nailImage:String = data["image"] as! String
            var nailTime:String = data["time"] as! String
            return (nailName, nailImage,nailTime)
            
        }
        return ("","","")
    }
    
    /*
    *アイテム情報を取得する関数
    *param レシピID　itemname(nail fude stone のどれか)
    *return (image,name,price)
    */

    func getNailItemData(id : String,itemName:String)-> (image:String,name:String,price:String)
    {
        if let data = defaults.dictionaryForKey(id)
        {
            
            if let item = data[itemName]{
                var image:String = item["image"] as! String
                var name:String = item["price"] as! String
                var price:String = item["name"] as! String
                return (image,name,price)
            }
        }
        return ("","","")
    }

    
    
    
}
