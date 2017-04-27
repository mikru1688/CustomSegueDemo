//
//  SegueAnimationA.swift
//  CustomSegueDemo
//
//  Created by Frank.Chen on 2017/4/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class SegueAnimationA: UIStoryboardSegue {
    
    override func perform() {
        // 取得來源端和目的端的視圖
        let VCAView = self.source.view as UIView! // 來源端(ViewController A)
        let VCBView = self.destination.view as UIView! // 目的端(ViewController B)
        
        // 取得畫面的寬度與高度
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // 設定目的端View B的初始位置(View A frame位置下方一個屏幕高度的地方)
        VCBView?.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
        
        // 取得App的key window並在來源端的View圖層上插入目的端的View
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(VCBView!, aboveSubview: VCAView!)
        
        // 轉場的動畫
        UIView.animate(withDuration: 0.7, animations: { () -> Void in
            // 兩個視圖同時向上移動一個屏幕的高度
            VCAView?.frame = (VCAView?.frame)!.offsetBy(dx: 0.0, dy: -screenHeight)
            VCBView?.frame = (VCBView?.frame)!.offsetBy(dx: 0.0, dy: -screenHeight)
        }) { (finish) -> Void in
            // 無動畫的方式呈現目的端的視圖
            self.source.present(self.destination as UIViewController, animated: false, completion: nil)
        }
    }
}
