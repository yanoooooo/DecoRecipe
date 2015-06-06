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
    
    
    //flg
    var Baseflg: Bool = false
    
    //SelecNailViewControllerからの引数
    var _second:String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //selectnailから受け取った画像の出力
        nailImg.image = UIImage(named: _second)
        
        //UIImageView
        BaseView = UIImageView(frame: CGRectMake(500,400,500,120))
        
        //color
        BaseView.backgroundColor = UIColor(red: 3/255, green: 195/255, blue: 201/255, alpha: 1.0)
        
        //add view
        self.view.addSubview(BaseView)
        
    }
    
    
    @IBAction func BasebtnPush(sender: UIButton) {
        //btn on
        if !Baseflg{
            Baseflg=true
            BaseViewOn()
        }
        else{
            Baseflg=false
            BaseViewOff()
        }
        
    }
    
    //Baseview
    private func BaseViewOn(){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                self.BaseView.center = CGPoint(x: 250,y: 460);
            }, completion: {(Bool) -> Void in
        })
    }
    
    private func BaseViewOff(){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                self.BaseView.center = CGPoint(x: 500,y: 460);
            }, completion: {(Bool) -> Void in
        })
    }
    
}
