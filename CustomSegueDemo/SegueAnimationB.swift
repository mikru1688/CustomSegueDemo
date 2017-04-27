//
//  SegueAnimationB.swift
//  CustomSegueDemo
//
//  Created by Frank.Chen on 2017/4/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class SegueAnimationB: UIStoryboardSegue {
    override func perform() {
        // 取得來源端和目的端的視圖
        let VCAView = self.source.view as UIView! // 來源端(ViewController A)
        let VCBView = self.destination.view as UIView! // 目的端(ViewController B)
        
        // 取得畫面的寬度與高度
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // 生成左邊和右邊的View
        let leftView = UIView()
        leftView.backgroundColor = UIColor.red
        let rightView = UIView()
        rightView.backgroundColor = UIColor.blue
        
        // 設定目的端、左邊、右邊View的初始位置
        VCBView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        leftView.frame = CGRect(x: -(screenWidth / 2), y: 0, width: screenWidth, height: screenHeight)
        rightView.frame = CGRect(x: screenWidth / 2, y: 0, width: screenWidth, height: screenHeight)
        
        // 取得App的key window並在來源端的View圖層上插入目的端、左邊、右邊的View
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(VCBView!, aboveSubview: VCAView!)
        window?.insertSubview(leftView, aboveSubview: VCBView!)
        window?.insertSubview(rightView, aboveSubview: VCBView!)
        
        // 轉場的動畫
        UIView.animate(withDuration: 0.7, animations: { () -> Void in
            leftView.frame = leftView.frame.offsetBy(dx:  -(screenWidth), dy: 0) // 左邊視圖向左
            rightView.frame = rightView.frame.offsetBy(dx: screenWidth, dy: 0) // 右邊視圖向右
        }) { (finish) -> Void in
            // 無動畫的方式呈現目的端的視圖
            self.source.present(self.destination as UIViewController, animated: false, completion: nil)
        }
    }           
}
