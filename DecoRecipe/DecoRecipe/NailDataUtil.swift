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
    
    class var sharedInstance : NailDataUtil {
        struct Static {
            static let instance : NailDataUtil = NailDataUtil()
            
        }
        return Static.instance
    }

    
    //こでだけせ生成
    // singleton in Swift 1.2
    //static let sharedController = NailDataUtil()
    
    //データ用の配列を生成
    var recipiSizde: Int = 0
    
    //選択しているデータのナンバー
    var selectedNum = ""
   
   
    //var recipiInfo: Dictionary = ["image":"","red":0.0,"green":0.0,"blue":0.0,"alpha":0.0]
    
    //plistからデータを取り出す関数
    func setPlistData()
    {
        // データを用意
        let itemData = ["name":"シャネル","price":"3000円","image":"ががががが"]
        let itemData2 = ["name":"ネイル工房オリジナルジェルネイルブラシ","price":"1000円","image":"ががががが"]
        let itemData3 = ["name":"ストーン","price":"500円","image":"ががががが"]
        let recipi1 = ["image":"g_oval01.png","red":248,"green":21,"blue": 60,"alpha":1.0,"x":128.0,"y":145.0]
        let recipi2 = ["image":"g_oval03.png","red":255,"green":255,"blue":255,"alpha":1.0,"x":128.0,"y":230.0]
        let recipi3 = ["image":"g_oval02.png","red":0,"green":206,"blue":209,"alpha":1.0,"x":130.0,"y":220.0]
        
        let recipi2_1 = ["image":"g_round01.png","red":248,"green":21,"blue":60,"alpha":1.0,"x":132.0,"y":145.0]
        let recipi2_2 = ["image":"g_round02.png","red":255,"green":255,"blue":255,"alpha":1.0,"x":132.0,"y":145.0]
        let recipi2_3 = ["image":"g_round03.png","red":0,"green":206,"blue":209,"alpha":1.0,"x":132.0,"y":213.0]
        
        let recipi3_1 = ["image":"g_square01.png","red":248,"green":21,"blue": 60,"alpha":1.0,"x":132.0,"y":145.0]
        let recipi3_2 = ["image":"g_square02.png","red":255,"green":255,"blue":255,"alpha":1.0,"x":132.0,"y":180.0]
        let recipi3_3 = ["image":"g_square03.png","red":0,"green":206,"blue":209,"alpha":1.0,"x":132.0,"y":145.0]


        
        //データ入れる
        let saveData = ["time":"30分","name": "MYM❤︎", "description": "初心者おすすめ！", "image": "nail0.jpg","item0":itemData,"item1":itemData2,"item3":itemData3,"recipi1":recipi1,"recipi2":recipi2,"recipi3":recipi3,"guideLine":"g_oval.png"]
        let saveData2 = ["time":"500年","name": "フランス革命", "description": "革命を歌う！", "image": "nail1.jpg","item0":itemData,"item1":itemData2,"item3":itemData3,"recipi1":recipi2_1,"recipi2":recipi2_2,"recipi3":recipi2_3,"guideLine":"g_round.png"]
        let saveData3 = ["time":"40分","name": "インターネットワンダーランド", "description": "インターネットはワンダーランドだ！", "image": "nail2.jpg","item0":itemData,"item1":itemData2,"item2":itemData3,"recipi1":recipi3_1 ,"recipi2":recipi3_2,"recipi3":recipi3_3,"guideLine":"g_square.png"]
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
    
    func getRecipiData( id : String ,recipiNum:String) -> (image:String, red:CGFloat, blue:CGFloat, green:CGFloat, alpha:CGFloat,xPosition:CGFloat,yPosition:CGFloat){
        
        if let name = defaults.dictionaryForKey(id)
        {
        
            if let recipi = name[recipiNum]{
                var image:String = recipi["image"] as! String
                var alpha:CGFloat = recipi["alpha"] as! CGFloat
                var red:CGFloat = recipi["red"] as! CGFloat
                var blue:CGFloat = recipi["blue"] as! CGFloat
                var green:CGFloat = recipi["green"] as! CGFloat
                var x:CGFloat = recipi["x"] as! CGFloat
                var y:CGFloat = recipi["y"] as! CGFloat

        
                return (image,red,blue,green,alpha,x,y)
            }
        }
         return ("", 0,0,0,0,0,0)
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
    *return nailName, nailImage,nailTime,nailGuidLine
    **/
    
    func getNeilDetailData(id : String)-> (name:String,image:String,time:String,guide:String)
    {
        if let data = defaults.dictionaryForKey(id)
        {
            var nailName:String = data["name"] as! String
            var nailImage:String = data["image"] as! String
            var nailTime:String = data["time"] as! String
            var nailGuidLine:String = data["guideLine"] as! String
            return (nailName, nailImage,nailTime,nailGuidLine)
            
        }
        return ("","","","")
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
                var name:String = item["name"] as! String
                var price:String = item["price"] as! String
                return (image,name,price)
            }
        }
        return ("","","")
    }


    /**
    *選択しているアイテムIDをセット
    */
    func setSelectedItemId(num:String)
    {
        self.selectedNum = num
           }

    }
