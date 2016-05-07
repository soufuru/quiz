//
//  ResultViewController.swift
//  Quiz2
//
//  Created by SoichiFurukawa on 2016/05/07.
//  Copyright © 2016年 FurukawaSoichi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //正解数
    var correctAnswer :Int = 0
    
    //結果を表示するラベル
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //正解数を表示
        resultLabel.text = String(correctAnswer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: AnyObject) {
        //2つ前の画面に戻る
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
