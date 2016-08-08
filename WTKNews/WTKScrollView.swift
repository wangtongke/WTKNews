//
//  ZHBInvestScrollView.swift
//  ZHBSwift
//
//  Created by 王同科 on 16/8/8.
//  Copyright © 2016年 王同科. All rights reserved.
//

import UIKit

class WTKScrollView: UIScrollView,UIScrollViewDelegate{
    let kWIDTH = UIScreen.mainScreen().bounds.width
    let kHEIGHT = UIScreen.mainScreen().bounds.height
    var array           : NSArray!
    var currentIndex    = 0
    var lineView        : UIView!
    var btnArray        = NSMutableArray()
    var lastBtn         : UIButton!
    var isClick         = true
    
    var btnClickPage    :((tag:Int) ->Void)!
    
    init(frame: CGRect,dataArray:NSArray) {
        super.init(frame: frame)
        self.backgroundColor    = UIColor.whiteColor()
        array                   = dataArray
        self.delegate           = self
        self.showsVerticalScrollIndicator   = false
        self.showsHorizontalScrollIndicator = false
        
        self.configView()
    }
    
    func configView(){
        self.contentSize = CGSizeMake(kWIDTH * 1.25, self.frame.size.height)
        
        for i in 0...4
        {
            let title: String       = array[i] as! String
            let width: CGFloat      = kWIDTH / 4
            let btn                 = UIButton.init(type: UIButtonType.Custom)
            btn.frame               = CGRectMake(CGFloat(i) * width, 0, width, 45)
            btn.titleLabel?.font    = UIFont.systemFontOfSize(14)
            btn.tag                 = i
            btn.backgroundColor     = UIColor.whiteColor()
            btn.setTitle(title, forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Disabled)
            btn.addTarget(self, action: #selector(WTKScrollView.btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(btn)
            btnArray.addObject(btn)
            if i == 0
            {
                btn.enabled     = false
                lastBtn         = btn
            }
            
        }
        
        lineView                    = UIView.init(frame: CGRectMake(0, 43, kWIDTH / 4, 2))
        lineView.backgroundColor    = UIColor.redColor()
        self.addSubview(lineView)
        
    }
    
    
    func btnClick(btn:UIButton){
        lastBtn.enabled         = true
        btn.enabled             = false
        lastBtn                 = btn
        let ws                  = WeakSelf(self) as! WTKScrollView
        UIView.animateWithDuration(0.3) {
            ws.lineView.frame    = CGRectMake(CGFloat(btn.tag) * ws.kWIDTH / 4, 43, ws.kWIDTH / 4, 2)
        }
        
        //        根据当前点击的btn，手动滚动scrollview
        if btn.tag == 1
        {
            //            点击第二个，偏移设为0  显示前四个
            let ws                  = WeakSelf(self) as!WTKScrollView
            UIView.animateWithDuration(0.3) {
                ws.contentOffset  = CGPointMake(0, 0)
            }
        }
        else if btn.tag == 2
        {
            //            设置当前显示后四个
            let ws                  = WeakSelf(self) as! WTKScrollView
            UIView.animateWithDuration(0.3) {
                ws.contentOffset  = CGPointMake(ws.kWIDTH / 4, 0)
            }
        }
        if isClick == false
        {
            isClick = true
            return
        }
        //        传给viewController
        if self.btnClickPage != nil
        {
            self.btnClickPage(tag: btn.tag)
            
        }
        
        
    }
    func WeakSelf(weakSelf:AnyObject) ->AnyObject{
        weak var ssss  = weakSelf
        return ssss!
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
