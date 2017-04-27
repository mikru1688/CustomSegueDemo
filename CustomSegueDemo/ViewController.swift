//
//  ViewController.swift
//  CustomSegueDemo
//
//  Created by Frank.Chen on 2017/4/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 點擊 Animation #A
    @IBAction func onClickAnimationA(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueAnimationA", sender: self)
    }
    
    // 點擊 Animation #B
    @IBAction func onClickAnimationB(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueAnimationB", sender: self)
    }
    
    // 點擊 Animation #C
    @IBAction func onClickAnimationC(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueAnimationC", sender: self)
    }
    
    // 必須要定義Segue返回的方法，否則便無法繼續
    @IBAction func backSegue(sender: UIStoryboardSegue) {
        if sender.identifier == "SegueAnimationA" {
            let originalColor = self.view.backgroundColor // 將原背景色存放起來(黃色)
            self.view.backgroundColor = UIColor.red
            
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
    }
}

