//
//  DetailViewController.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/06.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import UIKit

class DetailViewController:UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var itemScroll: UIScrollView!
    var itemPageCtrl: UIPageControl!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var time: UILabel!
    //@IBOutlet weak var itemImage: UIImageView!
   
    //ネイルデータモデル
    let datamodel =  NailDataUtil.sharedInstance
    
    override func viewDidLoad() {
        name.text = datamodel.getNeilDetailData("data"+datamodel.selectedNum).name
        
        image.image = UIImage(named: datamodel.getNeilDetailData("data"+datamodel.selectedNum).image)
        
        time.text = datamodel.getNeilDetailData("data"+datamodel.selectedNum).time
      

        // ページ数を定義する.
        let pageSize = 3
        
        // 縦方向と、横方向のインディケータを非表示にする.
        itemScroll.showsHorizontalScrollIndicator = false;
        itemScroll.showsVerticalScrollIndicator = false
        
        // ページングを許可する.
        itemScroll.pagingEnabled = true
        
        // ScrollViewのデリゲートを設定する.
        itemScroll.delegate = self
        
        // スクロールの画面サイズを指定する.
        itemScroll.contentSize = CGSizeMake(CGFloat(pageSize) * itemScroll.frame.width, 0)
        
        // ScrollViewをViewに追加する.
        //self.view.addSubview(itemScroll)
        
        // ページ数分ボタンを生成する.
        for var i = 0; i < pageSize; i++ {
           
            
            // アイテム（料金)ラベルを作成
            let myLabel:UILabel = UILabel(frame: CGRectMake(CGFloat(i) * itemScroll.frame.width + itemScroll.frame.width/2 - 40, itemScroll.frame.height/2 - 40, 80, 80))
            myLabel.backgroundColor = UIColor.orangeColor()
            myLabel.textColor = UIColor.blackColor()
            myLabel.textAlignment = NSTextAlignment.Center
            myLabel.layer.masksToBounds = true
           
            
            //アイテム
            let itemNamelabel:UILabel = UILabel(frame: CGRectMake(CGFloat(i) * itemScroll.frame.width + itemScroll.frame.width/2 - 40, itemScroll.frame.height/2 - 50, 120, 30))
            itemNamelabel.backgroundColor = UIColor.orangeColor()
            itemNamelabel.textColor = UIColor.blackColor()
            itemNamelabel.textAlignment = NSTextAlignment.Center
            itemNamelabel.layer.masksToBounds = true
        
            var itemnum: String = String(i)
            itemNamelabel.text = datamodel.getNailItemData("data"+datamodel.selectedNum, itemName: "item"+itemnum).name
           
            //画像
            var itemImageView: UIImageView = UIImageView(frame: CGRectMake(CGFloat(i) * itemScroll.frame.width+20, itemScroll.frame.height/5-15, 70, 70))
            itemImageView.image = UIImage(named:  datamodel.getNailItemData("data"+datamodel.selectedNum, itemName: "item"+itemnum).image)
            
           
            myLabel.text = datamodel.getNailItemData("data"+datamodel.selectedNum, itemName: "item"+itemnum).price
            myLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            //myLabel.layer.cornerRadius = 40.0
            
            // UIImageViewをViewに追加する.
            itemScroll.addSubview(itemImageView)
            itemScroll.addSubview(myLabel)
            itemScroll.addSubview(itemNamelabel)
        }
        
        // PageControlを作成する.
        itemPageCtrl = UIPageControl(frame: CGRectMake(0, (itemScroll.frame.origin.y+itemScroll.frame.height/2)+40, itemScroll.frame.width, 20))
        itemPageCtrl.backgroundColor = UIColor.blackColor()
        
        // PageControlするページ数を設定する.
        itemPageCtrl.numberOfPages = pageSize
        
        // 現在ページを設定する.
        itemPageCtrl.currentPage = 0
        itemPageCtrl.userInteractionEnabled = false
        
        self.view.addSubview(itemPageCtrl)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら時.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // ページの場所を切り替える.
            itemPageCtrl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
}

