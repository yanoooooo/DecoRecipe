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
        BaseView = UIImageView(frame: CGRectMake(500,420,500,100))
        PartsView = UIImageView(frame: CGRectMake(500,420,500,100))
        StoneView = UIImageView(frame: CGRectMake(500,420,500,100))
        
        //color
        BaseView.backgroundColor = UIColor(red: 3/255, green: 195/255, blue: 201/255, alpha: 1.0)
        PartsView.backgroundColor = UIColor(red: 255/255, green: 195/255, blue: 201/255, alpha: 1.0)
        StoneView.backgroundColor = UIColor(red: 255/255, green: 195/255, blue: 201/255, alpha: 1.0)
        
        //add view
        self.view.addSubview(BaseView)
        self.view.addSubview(PartsView)
        self.view.addSubview(StoneView)
        
    }
    
    
    @IBAction func BasebtnPush(sender: UIButton) {
        //btn on
        if !Baseflg{
            Baseflg=true
            menu1on(BaseView)
        }
        else{
            Baseflg=false
            menu1off(BaseView)
        }
        
    }
    
    @IBAction func PartsbtnPush(sender: UIButton) {
    }
    
    @IBAction func StonebtnPush(sender: UIButton) {
    }
    
    //menuOn
    private func menu1on(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 250,y: 480);
            }, completion: {(Bool) -> Void in
        })
    }
    
    
    private func menu1off(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 500,y: 480);
            }, completion: {(Bool) -> Void in
        })
    }
    
}
