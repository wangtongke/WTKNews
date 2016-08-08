//
//  ViewController.swift
//  WTKNews
//
//  Created by 王同科 on 16/8/8.
//  Copyright © 2016年 王同科. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let kWIDTH = UIScreen.mainScreen().bounds.width
    let kHEIGHT = UIScreen.mainScreen().bounds.height
    var scrollView          : WTKScrollView!
    var collectionView      : WTKCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configView(){
        scrollView          = WTKScrollView.init(frame: CGRectMake(0, 0, kWIDTH, 45), dataArray: ["精选推荐","科技","娱乐","美女","啦啦"])
        self.view.addSubview(scrollView)
        self.scrollViewPage()
        
        
        let layout          = UICollectionViewFlowLayout()
        layout.itemSize     = CGSizeMake(kWIDTH, kHEIGHT - 64 - 45)
        layout.minimumLineSpacing   = 0
        layout.minimumInteritemSpacing  = 0
        layout.scrollDirection      = UICollectionViewScrollDirection.Horizontal
        
        collectionView      = WTKCollectionView.init(frame: CGRectMake(0, 45, kWIDTH, kHEIGHT - 45), collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        self.collectionViewPage()
        
        
    }
    // MARK: -        collectionView 回调
    func collectionViewPage(){
        let ws  = WeakSelf(self) as! ViewController
        collectionView.changIndexPage = {
            (index:Int) -> Void in
            ws.scrollView.isClick = false
            let btn : UIButton = ws.scrollView.btnArray[index] as! UIButton
            ws.scrollView.btnClick(btn)
        }
    }
    //    MARK: - scrollView回调
    func scrollViewPage(){
        let ws  = WeakSelf(self) as! ViewController
        scrollView.btnClickPage = {
            (tag:Int) -> Void in
            ws.collectionView.scrollToItemAtIndexPath(NSIndexPath.init(forRow: tag, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: true)
            
        }
    }
    func WeakSelf(weakSelf:AnyObject) ->AnyObject{
        weak var ssss  = weakSelf
        return ssss!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

