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
    
    //parts
    var setPartsView: UIImageView!
    
    //button
    var BaseDonebtn: UIButton!
    var PartsDonebtn: UIButton!
    var StoneDonebtn: UIButton!
    
    //baseviewbutton
    var basecolor1: UIButton!
    var basecolor2: UIButton!
    var basecolor3: UIButton!
    var basecolor4: UIButton!
    
    //partsview button
    var partsbtn1: UIButton!
    var partsbtn2: UIButton!
    var partsbtn3: UIButton!
    
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
        setPartsView = UIImageView(frame: CGRectMake(54,0,130,240))
        
        BaseView.contentMode = UIViewContentMode.ScaleAspectFit
        PartsView.contentMode = UIViewContentMode.ScaleAspectFit
        StoneView.contentMode = UIViewContentMode.ScaleAspectFit
        
        BaseView.clipsToBounds = true
        PartsView.clipsToBounds = true
        StoneView.clipsToBounds = true
        setPartsView.clipsToBounds = true
        
        //menu image
        BaseView.image = UIImage(named: "bottombar.png")
        PartsView.image = UIImage(named: "bottombar.png")
        StoneView.image = UIImage(named: "bottombar.png")
        
        //create done button
        BaseDonebtn = UIButton()
        PartsDonebtn = UIButton()
        StoneDonebtn = UIButton()
        
        //set image
        BaseDonebtn.setImage(UIImage(named: "done2.png"), forState: .Normal)
        PartsDonebtn.setImage(UIImage(named: "done2.png"), forState: .Normal)
        StoneDonebtn.setImage(UIImage(named: "done2.png"), forState: .Normal)
        
        //set size
        BaseDonebtn.frame = CGRectMake(15,15,60,60)
        PartsDonebtn.frame = CGRectMake(15,15,60,60)
        StoneDonebtn.frame = CGRectMake(15,15,60,60)
        
        //add button event
        BaseView.userInteractionEnabled = true
        BaseDonebtn.addTarget(self, action: "BaseDonebtnPush:", forControlEvents: .TouchUpInside)
        PartsView.userInteractionEnabled = true
        PartsDonebtn.addTarget(self, action: "PartsDonebtnPush:", forControlEvents: .TouchUpInside)
        StoneView.userInteractionEnabled = true
        StoneDonebtn.addTarget(self, action: "StoneDonebtnPush:", forControlEvents: .TouchUpInside)
        
        //add view
        self.view.addSubview(BaseView)
        self.view.addSubview(PartsView)
        self.view.addSubview(StoneView)
        self.view.addSubview(setPartsView)
        
        //add button
        self.BaseView.addSubview(BaseDonebtn)
        self.PartsView.addSubview(PartsDonebtn)
        self.StoneView.addSubview(StoneDonebtn)
        
        //base bar settings
        basecolor1 = UIButton()
        basecolor1.setImage(UIImage(named: "colorpalette1.png"), forState: .Normal)
        basecolor1.frame = CGRectMake(85,25,40,40)
        basecolor1.addTarget(self, action: "BaseColorbtnPush:", forControlEvents: .TouchUpInside)
        basecolor1.tag = 0
        self.BaseView.addSubview(basecolor1)
        
        basecolor2 = UIButton()
        basecolor2.setImage(UIImage(named: "colorpalette2.png"), forState: .Normal)
        basecolor2.frame = CGRectMake(145,25,40,40)
        basecolor2.addTarget(self, action: "BaseColorbtnPush:", forControlEvents: .TouchUpInside)
        basecolor2.tag = 1
        self.BaseView.addSubview(basecolor2)
        
        basecolor3 = UIButton()
        basecolor3.setImage(UIImage(named: "colorpalette3.png"), forState: .Normal)
        basecolor3.frame = CGRectMake(205,25,40,40)
        basecolor3.addTarget(self, action: "BaseColorbtnPush:", forControlEvents: .TouchUpInside)
        basecolor3.tag = 2
        self.BaseView.addSubview(basecolor3)
        
        basecolor4 = UIButton()
        basecolor4.setImage(UIImage(named: "colorpalette4.png"), forState: .Normal)
        basecolor4.frame = CGRectMake(265,25,40,40)
        basecolor4.addTarget(self, action: "BaseColorbtnPush:", forControlEvents: .TouchUpInside)
        basecolor4.tag = 3
        self.BaseView.addSubview(basecolor4)
        
        //parts bar settings
        var iname: String = ""
        if _second == "g_oval.png"{iname = "ovalicon1.png"}
        else if _second == "g_round.png"{iname = "roundicon1.png"}
        else if _second == "g_square.png"{iname = "squareicon1.png"}
        partsbtn1 = UIButton()
        partsbtn1.setImage(UIImage(named: iname), forState: .Normal)
        partsbtn1.frame = CGRectMake(100,8,40,70)
        partsbtn1.addTarget(self, action: "SelectPartsbtnPush:", forControlEvents: .TouchUpInside)
        partsbtn1.tag = 0
        self.PartsView.addSubview(partsbtn1)
        
        if _second == "g_oval.png"{iname = "ovalicon2.png"}
        else if _second == "g_round.png"{iname = "roundicon2.png"}
        else if _second == "g_square.png"{iname = "squareicon2.png"}
        partsbtn2 = UIButton()
        partsbtn2.setImage(UIImage(named: iname), forState: .Normal)
        partsbtn2.frame = CGRectMake(170,8,40,70)
        partsbtn2.addTarget(self, action: "SelectPartsbtnPush:", forControlEvents: .TouchUpInside)
        partsbtn2.tag = 1
        self.PartsView.addSubview(partsbtn2)
        
        if _second == "g_oval.png"{iname = "ovalicon3.png"}
        else if _second == "g_round.png"{iname = "roundicon3.png"}
        else if _second == "g_square.png"{iname = "squareicon3.png"}
        partsbtn3 = UIButton()
        partsbtn3.setImage(UIImage(named: iname), forState: .Normal)
        partsbtn3.frame = CGRectMake(240,8,40,70)
        partsbtn3.addTarget(self, action: "SelectPartsbtnPush:", forControlEvents: .TouchUpInside)
        partsbtn3.tag = 2
        self.PartsView.addSubview(partsbtn3)
        
        
        //rendering
        let selectedImage: UIImage = nailImg.image!.imageWithRenderingMode(.AlwaysTemplate)
        nailImg.image = selectedImage
        nailImg.tintColor = UIColor(red: 255/255, green: 225/255, blue: 230/255, alpha: 255/255)
        
    }
    
    //color button
    internal func BaseColorbtnPush(sender: UIButton){
        switch sender.tag {
        case 0:
            nailImg.tintColor = UIColor(red: 255/255, green: 82/255, blue: 46/255, alpha: 255/255)
        case 1:
            nailImg.tintColor = UIColor(red: 251/255, green: 221/255, blue: 64/255, alpha: 255/255)
        case 2:
            nailImg.tintColor = UIColor(red: 3/255, green: 243/255, blue: 194/255, alpha: 255/255)
        case 3:
            nailImg.tintColor = UIColor(red: 3/255, green: 77/255, blue: 111/255, alpha: 255/255)
        default:
            break // do nothing
        }
        
    }
    
    //select parts button
    internal func SelectPartsbtnPush(sender: UIButton){
        switch sender.tag {
        case 0:
            var iname: String = ""
            if _second == "g_oval.png"{iname = "oval01.png"}
            else if _second == "g_round.png"{iname = "round01.png"}
            else if _second == "g_square.png"{iname = "square01.png"}
            
            //setimageview
            //setPartsView = UIImageView(frame: CGRectMake(0,0,90, 200))
            setPartsView.image = UIImage(named: iname)
            let selectedImage: UIImage = setPartsView.image!.imageWithRenderingMode(.AlwaysTemplate)
            setPartsView.image = selectedImage
            setPartsView.tintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 255/255)
            
            setPartsView.contentMode = UIViewContentMode.ScaleAspectFit
            
        case 1:
            nailImg.tintColor = UIColor(red: 251/255, green: 221/255, blue: 64/255, alpha: 255/255)
        case 2:
            nailImg.tintColor = UIColor(red: 3/255, green: 243/255, blue: 194/255, alpha: 255/255)
        default:
            break // do nothing
        }
    }
    
    //base button
    internal func BaseDonebtnPush(sender: UIButton){
        if Baseflg{
            Baseflg=false
            bottomBarOff(BaseView)
        }
    }
    
    //parts button
    internal func PartsDonebtnPush(sender: UIButton){
        if Partsflg{
            Partsflg=false
            bottomBarOff(PartsView)
        }
    }
    
    //stone button
    internal func StoneDonebtnPush(sender: UIButton){
        if Stoneflg{
            Stoneflg=false
            bottomBarOff(StoneView)
        }
    }

    
    @IBAction func BasebtnPush(sender: UIButton) {
        //btn on
        if !Baseflg && !Partsflg && !Stoneflg{
            Baseflg=true
            bottomBarOn(BaseView)
        }
    }
    
    @IBAction func PartsbtnPush(sender: UIButton) {
        //btn on
        if !Baseflg && !Partsflg && !Stoneflg{
            Partsflg=true
            bottomBarOn(PartsView)
        }
    }
    
    @IBAction func StonebtnPush(sender: UIButton) {
        //btn on
        if !Baseflg && !Partsflg && !Stoneflg{
            Stoneflg=true
            bottomBarOn(StoneView)
        }
    }
    
    //menuOn
    private func bottomBarOn(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 250,y: 475);
            }, completion: {(Bool) -> Void in
        })
    }
    
    
    private func bottomBarOff(iv:UIImageView){
        // アニメーション処理
        UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
            animations: {() -> Void in
                // 移動先の座標を指定する.
                iv.center = CGPoint(x: 570,y: 480);
            }, completion: {(Bool) -> Void in
        })
    }
    
}
