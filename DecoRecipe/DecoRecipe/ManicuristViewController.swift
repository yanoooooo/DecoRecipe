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
    var palletView: UIImageView!
    var animator : UIDynamicAnimator!
    var continuousPush : UIPushBehavior!
    var instantaneousPush : UIPushBehavior!
    
    //SelecNailViewControllerからの引数
    var _second:String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //selectnailから受け取った画像の出力
        nailImg.image = UIImage(named: _second)
        
        //UIImageView
        palletView = UIImageView(frame: CGRectMake(0,400,500,120))
        
        //color
        palletView.backgroundColor = UIColor.blackColor()
        
        // UIDynamiAnimatorの生成とインスタンスの保存.
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // UIViewを等加速度運動で動かすUIPushBehaviorを生成.
        continuousPush = UIPushBehavior(items: [palletView], mode: UIPushBehaviorMode.Continuous)
        continuousPush.pushDirection = CGVectorMake(-1.0, 0.0)
        
        // UIViewを等速運動で動かすUIPushBehaviorを生成.
        instantaneousPush = UIPushBehavior(items: [palletView], mode: UIPushBehaviorMode.Instantaneous)
        instantaneousPush.pushDirection = CGVector(dx: -1.0, dy: 0.0)
        
        //add view
        self.view.addSubview(palletView)
        
    }
    
    
    @IBAction func BasebtnPush(sender: UIButton) {
        animator.addBehavior(continuousPush)
    }
    
    /*
    Buttonが押されたときに呼ばれるメソッド.
    */
    func onClickMyButton(sender : UIButton){
        
        switch(sender.tag){
        case 1:
            animator.addBehavior(continuousPush)
            
        case 2:
            animator.addBehavior(instantaneousPush)
            
        default:
            println("Error")
        }
    }
    
}
