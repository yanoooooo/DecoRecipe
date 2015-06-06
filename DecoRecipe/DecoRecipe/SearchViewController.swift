//
//  FirstViewController.swift
//  DecoRecipe
//
//  Created by Yano on 2015/06/01.
//  Copyright (c) 2015年 Yano. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    let datamodel =  NailDataUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //データをセット(最初だけでいい)
        datamodel.setPlistData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDelegate Protocol
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        var row: Int = indexPath.row
        var datanume: String = String(row)
        
        cell.title.text = String(datamodel.getNailData("data"+datanume).name)
        if row > 2{row = 0}
        cell.image.image = UIImage(named: datamodel.getNailData("data"+datanume).image)
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }


}

