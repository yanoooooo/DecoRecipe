//
//  ColorUtil.swift
//  Manicurist
//
//  Created by Yano on 2015/06/05.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import Foundation

class ColorUtil{
    //２色を比較して近い色だったらtrueを返す
    class func compareColor(rgb1:UIColor, rgb2:UIColor) -> Bool{
        var tof: Bool = false
        var val: CGFloat = 0.3
        
        var red1: CGFloat     = 1.0
        var green1: CGFloat   = 1.0
        var blue1: CGFloat    = 1.0
        var alpha1: CGFloat   = 1.0
        
        var red2: CGFloat     = 1.0
        var green2: CGFloat   = 1.0
        var blue2: CGFloat    = 1.0
        var alpha2: CGFloat   = 1.0
        
        //色の取得
        rgb1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        rgb2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        //red
        var comp:CGFloat = red1-red2
        if comp > -val && comp < val {
            //green
            comp = green1 - green2
            if comp > -val && comp < val {
                //blue
                comp = blue1 - blue2
                if comp > -val && comp < val {tof = true}
            }
        }
        
        //println( "R:\(red1) G:\(green1) B:\(blue1) a:\(alpha1)" )
        //println( "R:\(red2) G:\(green2) B:\(blue2) a:\(alpha2)" )
        println(tof)
        
        return true
    }
    
    //CGPointに含まれる色データをUIImageから取得して返す
    class func getPixelColorFromUIImage(myUIImage:UIImage, pos: CGPoint) -> UIColor {
        
        //ピクセルデータ取得してバイナリ化
        var pixelData = CGDataProviderCopyData(CGImageGetDataProvider(myUIImage.CGImage))
        var data: UnsafePointer = CFDataGetBytePtr(pixelData)
        
        //RGBおよびアルファ値を取得します
        var pixelInfo: Int = ((Int(myUIImage.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        var r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        var g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        var b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        var a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}