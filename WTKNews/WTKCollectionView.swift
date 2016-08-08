//
//  ZHBInvestCollectionView.swift
//  ZHBSwift
//
//  Created by 王同科 on 16/8/8.
//  Copyright © 2016年 王同科. All rights reserved.
//

import UIKit

class WTKCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate {
    
    var changIndexPage      : ((index:Int) ->Void)!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate           = self
        self.dataSource         = self
        self.pagingEnabled      = true
        //        self.showsVerticalScrollIndicator   = false
        //        self.showsHorizontalScrollIndicator = false
        self.configView()
    }
    
    func configView(){
        self.registerNib(UINib.init(nibName: "WTKCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: "cell")
        
    }
    
    
    
    
    //    MARK: - collectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : WTKCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! WTKCollectionViewCell
        return cell
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let indexPath : Int =  Int(scrollView.contentOffset.x / self.frame.size.width)
        if changIndexPage != nil
        {
            changIndexPage(index:indexPath)
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
