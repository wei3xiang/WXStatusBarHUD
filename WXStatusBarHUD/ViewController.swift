//
//  ViewController.swift
//  WXStatusBarHUD
//
//  Created by 魏翔 on 16/7/29.
//  Copyright © 2016年 魏翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didClickSuccess(sender: AnyObject) {
        WXStatusBarHUD.showSuccess("成功")
    }


    @IBAction func 普通信息(sender: AnyObject) {
        WXStatusBarHUD.showMessage("刷新20条")
    }
    
    @IBAction func didClickFailsure(sender: AnyObject) {
        WXStatusBarHUD.showError("失败")
    }
    
    
    @IBAction func didClickLoading(sender: AnyObject) {
        WXStatusBarHUD.showLoading("加载")
    }
    
    @IBAction func didClickHide(sender: AnyObject) {
        WXStatusBarHUD.hide()
    }
    
}

