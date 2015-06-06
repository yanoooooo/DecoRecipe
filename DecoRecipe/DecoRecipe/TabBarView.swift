//
//  TabBarView.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/06.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import UIKit

class TabBarView: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var assets :Array<String> = ["icon3.png", "icon2.png", "icon4.png", "icon1.png"]
        for (idx, item) in enumerate(self.tabBar.items as! [UITabBarItem]) {
            if let image = item.image {
                item.image = UIImage(named: assets[idx])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            }
        }
        
            
        // アイコンの選択された時の色変えたい
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 27/255, blue: 124/255, alpha: 1.0)
        
        // 背景色変えたい
        UITabBar.appearance().barTintColor = UIColor.blackColor()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
