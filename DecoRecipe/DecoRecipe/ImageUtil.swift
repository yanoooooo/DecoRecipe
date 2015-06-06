//
//  DetectUtil.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/03.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ImageUtil {
    
    // sampleBufferからUIImageへ変換
    class func imageFromSampleBuffer(sampleBuffer: CMSampleBufferRef) -> UIImage {
        let imageBuffer: CVImageBufferRef = CMSampleBufferGetImageBuffer(sampleBuffer)
        
        // ベースアドレスをロック
        CVPixelBufferLockBaseAddress(imageBuffer, 0)
        
        // 画像データの情報を取得
        let baseAddress: UnsafeMutablePointer<Void> = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)
        
        let bytesPerRow: Int = CVPixelBufferGetBytesPerRow(imageBuffer)
        let width: Int = CVPixelBufferGetWidth(imageBuffer)
        let height: Int = CVPixelBufferGetHeight(imageBuffer)
        
        // RGB色空間を作成
        let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()
        
        // Bitmap graphic contextを作成
        let bitsPerCompornent: Int = 8
        var bitmapInfo = CGBitmapInfo((CGBitmapInfo.ByteOrder32Little.rawValue | CGImageAlphaInfo.PremultipliedFirst.rawValue) as UInt32)
        let newContext: CGContextRef = CGBitmapContextCreate(baseAddress, width, height, bitsPerCompornent, bytesPerRow, colorSpace, bitmapInfo) as CGContextRef
        
        // Quartz imageを作成
        let imageRef: CGImageRef = CGBitmapContextCreateImage(newContext)
        
        // UIImageを作成
        let resultImage: UIImage = UIImage(CGImage: imageRef)!
        
        return resultImage
    }
    
    //ガイドラインの内側の切り抜き
    class func clipImg(srcImg: UIImage, rect: CGRect) -> UIImage{
        var dstImg: UIImage = UIImage()
        let clipRect  = CGRectMake(
            rect.origin.x+25, rect.origin.y-35,
            rect.width, rect.height)
        let clipRef   = CGImageCreateWithImageInRect(srcImg.CGImage, clipRect)
        dstImg = UIImage(CGImage: clipRef)!
        
        return dstImg
    }
}
