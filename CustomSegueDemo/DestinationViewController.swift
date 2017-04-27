//
//  DestinationViewController.swift
//  CustomSegueDemo
//
//  Created by Frank.Chen on 2017/4/27.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // 點擊 back
    @IBAction func onClickBack(_ sender: Any) {
        self.performSegue(withIdentifier: "UnwindSegue", sender: self)
    }
}
