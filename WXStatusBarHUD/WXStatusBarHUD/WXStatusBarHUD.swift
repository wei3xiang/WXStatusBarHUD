//
//  WXStatusBarHUD.swift
//  WXStatusBarHUD
//
//  Created by 魏翔 on 16/7/29.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class WXStatusBarHUD:NSObject {
    
    /** 消息停留时间 */
    static let MessageDuration = 2.0
    /** 消息显示\隐藏的动画时间*/
    static let AnimationDuration = 0.25
    /** 全局窗口 */
    static var window: UIWindow?
    /** 定时器*/
    static var timer: NSTimer?

   /** 显示窗口 */
    class func showWindow(){
        
        let windowHeight: CGFloat = 20
        
        var frame = CGRectMake(0, -windowHeight, UIScreen.mainScreen().bounds.size.width, windowHeight)
        
        window?.hidden = true
        
        window = UIWindow()

        window?.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.5, blue: 0.0, alpha: 0.8)
        
        window?.windowLevel = UIWindowLevelAlert
        
        window?.frame = frame
        
        window?.hidden = false
        
        frame.origin.y = 0
        
        UIView.animateWithDuration(AnimationDuration) { () -> Void in
            window?.frame = frame
        }
        
    }
    
    /** 普通信息 */
    class func showMessage(msg: String){
        showMessage(msg, image: nil)
    }
    
    /** 成功信息 */
    class func showSuccess(msg: String){
        showMessage(msg, image: UIImage(named: "WXStatusBarHUD.bundle/success"))
    }

    /** 错误信息 */
    class func showError(msg: String){
        showMessage(msg, image: UIImage(named: "WXStatusBarHUD.bundle/error"))
    }
    
    /** 加载 */
    class func showLoading(msg: NSString) {
        // 停止定时器
        timer?.invalidate()
        timer = nil
        // 显示窗口
        showWindow()
        // 添加文字
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(12)
        label.frame = window!.bounds
        label.text = msg as String
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        window!.addSubview(label)
        // 添加圈圈
        let loadingView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        loadingView.startAnimating()
        // 文字宽度
        let msgW = msg.sizeWithAttributes([NSFontAttributeName : UIFont.systemFontOfSize(12)]).width
        let centerX = (window!.frame.size.width - msgW) * 0.5 - 20
        let centerY = window!.frame.size.height * 0.5
        loadingView.center = CGPointMake(centerX, centerY)
        window!.addSubview(loadingView)
        
    }
    
    /** 有图片的信息 */
    class func showMessage(msg: String, image: UIImage?) {
        // 停止定时器
        timer?.invalidate()
        // 显示窗口
        showWindow()
        // 添加按钮
        let button = UIButton(type: .Custom)
        button.setTitle(msg, forState: .Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(12)
        if let img = image{
            button.setImage(img, forState: .Normal)
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        }
        window!.addSubview(button)
        button.frame = window!.bounds
        timer = NSTimer.scheduledTimerWithTimeInterval(MessageDuration, target: self, selector: Selector("hide"), userInfo: nil, repeats: false)

    }
    
    /** 隐藏状态栏 */
    class func hide() {
        
        UIView.animateWithDuration(AnimationDuration, animations: { () -> Void in
            
                var frame = window?.frame
                
                frame?.origin.y = -(frame?.size.height)!
                
                self.window?.frame = frame!
            
            }) { (b) -> Void in
                
                self.window = nil

                self.timer = nil
        }
        
    }

}
