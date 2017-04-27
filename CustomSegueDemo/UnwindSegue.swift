//
//  UnwindSegue.swift
//  CustomSegueDemo
//
//  Created by Frank.Chen on 2017/4/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class UnwindSegue: UIStoryboardSegue {
    override func perform() {
        // 取得來源端和目的端的視圖，因為是反向的所以來源端是DestinationViewController，目的端是ViewController
        let VCBView = self.source.view as UIView! // 來源端(ViewController B)
        let VCAView = self.destination.view as UIView!  // 目的端(ViewController A)
        
        // 因來源端的View已存在，故不需像第一個轉第二個如此要取得寬和度來設定目的端View的frame，而這邊的高也單純只是用來移動frame位置如此而己
        let screenHeight = UIScreen.main.bounds.size.height
        
        // 設定目的端View A的初始位置(View B frame位置上方一個屏幕高度的地方)
        VCAView?.frame.origin = CGPoint(x: 0, y: -screenHeight)
        
        // 取得App的key window並在來源端的View圖層上插入目的端的View
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(VCAView!, aboveSubview: VCBView!)
        
        // 轉場的動畫
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            // 兩個視圖同時向下移動一個屏幕的高度
            VCAView?.frame = (VCAView?.frame)!.offsetBy(dx: 0.0, dy: screenHeight)
            VCBView?.frame = (VCBView?.frame)!.offsetBy(dx: 0.0, dy: screenHeight)
        }) { (finish) -> Void in
            // 將來源端視圖移除
            self.source.dismiss(animated: false, completion: nil)
        }
    }
}
