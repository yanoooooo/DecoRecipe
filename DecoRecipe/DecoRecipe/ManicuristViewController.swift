//
//  ManicuristViewController.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/06.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import UIKit

class ManicuristViewController: UIViewController{
    @IBOutlet weak var Basebtn: UIButton!
    @IBOutlet weak var Partsbtn: UIButton!
    @IBOutlet weak var Stonebtn: UIButton!
    
    @IBOutlet weak var nailImg: UIImageView!
    
    //animation
    var BaseView: UIImageView!
    var PartsView: UIImageView!
    var StoneView: UIImageView!
    
    
    //flg
    var Baseflg: Bool = false
    var Partsflg: Bool = false
    var Stoneflg: Bool = false
    
    //SelecNailViewControllerからの引数
    var _second:String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //selectnailから受け取った画像の出力
        nailImg.image = UIImage(named: _second)
        
        //UIView
        BaseView = UIImageView(frame: CGRectMake(500,430,500, 90))
        PartsView = UIImageView(frame: CGRectMake(500,430,500, 90))
        StoneView = UIImageView(frame: CGRectMake(500,430,500, 90))
        
        //menu image
        BaseView.image = UIImage(named: "bottombar.png")
        PartsView.image = UIImage(named: "bottombar.png")
        StoneView.image = UIImage(named: "bottombar.png")
        
        //add view
        self.view.addSubview(BaseView)
        self.view.addSubview(PartsView)
        self.view.addSubview(StoneView)
        
        //rendering
        let selectedImage: UIImage = nailImg.image!.imageWithRenderingMode(.AlwaysTemplate)
        nailImg.image = selectedImage
        nailImg.tintColor = UIColor(red: 255/255, green: 225/255, blue: 230/255, alpha: 255/255)
        
    }
    
    
    @IBAction func BasebtnPush(sender: UIButton) {
        //btn on
        if !Baseflg{
            Baseflg=true
            menu1on(BaseView)
            if Partsflg{
                Partsflg=false
                menu1off(PartsView)
            }
            if Stoneflg{
                Stoneflg=false
                menu1off(StoneView)
            }
        }
        else{
            Baseflg=false
            menu1off(BaseView)
        }
    }
    
    @IBAction func PartsbtnPush(sender: UIButton) {
        //btn on
        if !Partsflg{
            Partsflg=true
            menu1on(PartsView)
            if Baseflg{
                Baseflg=false
                menu1off(BaseView)
            }
            if Stoneflg{
                Stoneflg=false
                menu1off(StoneView)
            }
        }
        else{
            Partsflg=false
            menu1off(PartsView)
        }
    }
    
    @IBAction func StonebtnPush(sender: UIButton) {
        //btn on
        if !Stoneflg{
            Stoneflg=true
            menu1on(StoneView)
            if Baseflg{
                Baseflg=false
                menu1off(BaseView)
            }
            if Partsflg{
                Partsflg=false
                menu1off(PartsView)
            }
        }
        else{
            Stoneflg=false
            menu1off(StoneView)
        }
    }
    
    //menuOn
    private func menu1on(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 250,y: 475);
            }, completion: {(Bool) -> Void in
        })
    }
    
    
    private func menu1off(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 570,y: 480);
            }, completion: {(Bool) -> Void in
        })
    }
    
}
