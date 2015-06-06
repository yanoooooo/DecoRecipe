//
//  DecoViewController.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/03.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import UIKit
import AVFoundation

class DecoViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var guideImg: UIImageView!
    
    var partsImgView: UIImageView!
    var partsImg: UIImage!
    
    // セッション.
    var mySession : AVCaptureSession!
    // デバイス.
    var myDevice : AVCaptureDevice!
    var light : AVCaptureDevice!
    // 出力先
    var myOutput : AVCaptureVideoDataOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //device light
        light = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        light.lockForConfiguration(nil)
        
        // カメラを準備
        if initCamera() {
            // 撮影開始
            mySession.startRunning()
        }
        
        //ガイドラインの画像の設定
        self.guideImg.image = UIImage(named: "g_square.png")
        
        //最初のパーツの設定
        // UIImageViewを作成する.
        partsImgView = UIImageView(frame: guideImg.frame)
        
        // 表示する画像を設定する.
        partsImg = UIImage(named: "base.png")
        
        // 画像をUIImageViewに設定する.
        partsImgView.image = partsImg
        
        // 画像の表示する座標を指定する.
        partsImgView.layer.position = CGPoint(x: guideImg.frame.origin.x+guideImg.frame.size.width/2, y: guideImg.frame.origin.y+guideImg.frame.size.height/2)
        
        //alpha
        partsImgView.alpha = 0.5;
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(partsImgView)
    }
    
    override func viewDidAppear(animated: Bool) {
        light.torchMode = AVCaptureTorchMode.On //On
    }
    
    override func viewDidDisappear(animated: Bool) {
        light.torchMode = AVCaptureTorchMode.Off //Off
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // カメラの準備処理
    func initCamera() -> Bool {
        // セッションの作成.
        mySession = AVCaptureSession()
        
        // 解像度の指定.
        mySession.sessionPreset = AVCaptureSessionPresetMedium
        
        
        // デバイス一覧の取得.
        let devices = AVCaptureDevice.devices()
        
        // バックカメラをmyDeviceに格納.
        for device in devices {
            if(device.position == AVCaptureDevicePosition.Back){
                myDevice = device as! AVCaptureDevice
            }
        }
        if myDevice == nil {
            return false
        }
        
        // バックカメラからVideoInputを取得.
        let myInput = AVCaptureDeviceInput.deviceInputWithDevice(myDevice, error: nil) as!AVCaptureDeviceInput
        
        
        // セッションに追加.
        if mySession.canAddInput(myInput) {
            mySession.addInput(myInput)
        } else {
            return false
        }
        
        // 出力先を設定
        myOutput = AVCaptureVideoDataOutput()
        myOutput.videoSettings = [ kCVPixelBufferPixelFormatTypeKey: kCVPixelFormatType_32BGRA ]
        
        // FPSを設定
        var lockError: NSError?
        if myDevice.lockForConfiguration(&lockError) {
            if let error = lockError {
                println("lock error: \(error.localizedDescription)")
                return false
            } else {
                myDevice.activeVideoMinFrameDuration = CMTimeMake(1, 15)
                myDevice.unlockForConfiguration()
            }
        }
        
        // デリゲートを設定
        let queue: dispatch_queue_t = dispatch_queue_create("myqueue",  nil)
        myOutput.setSampleBufferDelegate(self, queue: queue)
        
        
        // 遅れてきたフレームは無視する
        myOutput.alwaysDiscardsLateVideoFrames = true
        
        
        // セッションに追加.
        if mySession.canAddOutput(myOutput) {
            mySession.addOutput(myOutput)
        } else {
            return false
        }
        
        // カメラの向きを合わせる
        for connection in myOutput.connections {
            if let conn = connection as? AVCaptureConnection {
                if conn.supportsVideoOrientation {
                    conn.videoOrientation = AVCaptureVideoOrientation.Portrait
                }
            }
        }
        
        return true
    }
    
    
    // 毎フレーム実行される処理
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!)
    {
        dispatch_async(dispatch_get_main_queue(), {
            // UIImageへ変換して表示させる
            self.mainImg.image = ImageUtil.imageFromSampleBuffer(sampleBuffer)
            
            //ガイドライン内を切り抜く
            self.partsImgView.image = ImageUtil.clipImg(self.mainImg.image!, rect: self.partsImgView.frame)
            
            //切り抜いた画像を１色にする
            self.partsImgView.image = CVUtil.reduceColor(self.partsImgView.image)
            
            //切り抜いた１色とガイドラインのRGB値を比較する
            ColorUtil.compareColor(ColorUtil.getPixelColorFromUIImage(self.partsImgView.image!, pos: CGPoint(x: 0,y: 0)), rgb2: UIColor(red: 248/255, green: 21/255, blue: 60/255, alpha: 255/255))
            
        })
    }
    
}