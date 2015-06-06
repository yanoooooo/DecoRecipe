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
    
    override func viewDidLoad() {
        
        // ページ数を定義する.
        let pageSize = 4
        
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
            // ページごとに異なるラベルを生成する.
            let myLabel:UILabel = UILabel(frame: CGRectMake(CGFloat(i) * itemScroll.frame.width + itemScroll.frame.width/2 - 40, itemScroll.frame.height/2 - 40, 80, 80))
            myLabel.backgroundColor = UIColor.blackColor()
            myLabel.textColor = UIColor.whiteColor()
            myLabel.textAlignment = NSTextAlignment.Center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            myLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
            myLabel.layer.cornerRadius = 40.0
            
            itemScroll.addSubview(myLabel)
        }
        
        // PageControlを作成する.
        itemPageCtrl = UIPageControl(frame: CGRectMake(0, (itemScroll.frame.origin.y+itemScroll.frame.height/2)+30, itemScroll.frame.width, 20))
        itemPageCtrl.backgroundColor = UIColor.orangeColor()
        
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

