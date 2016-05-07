//
//  QuizViewController.swift
//  Quiz2
//
//  Created by SoichiFurukawa on 2016/05/07.
//  Copyright © 2016年 FurukawaSoichi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    
    //問題文を格納
    var quizArray = [AnyObject]()
    
    //正解数
    var correctAnswer :Int = 0
    
    //クイズを表示するテキストビュー
    @IBOutlet weak var QuizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet weak var choicebutton1: UIButton!
    @IBOutlet weak var choicebutton2: UIButton!
    @IBOutlet weak var choicebutton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一時的にクイズを保存しておく配列
        var tmpArray = [AnyObject]()
        
        tmpArray.append(["クイズ1","a","b","c",1])
        tmpArray.append(["クイズ2","a","b","c",2])
        tmpArray.append(["クイズ3","a","b","c",3])
        
        //問題文をシャッフル
        srand(UInt32(time(nil)))
        while(tmpArray.count > 0){
            let index = Int(rand()) % tmpArray.count //(0〜(問題数の数-1))の範囲の乱数を生成
            quizArray.append(tmpArray[index]) //問題をquizArrayへ移動
            tmpArray.removeAtIndex(index) //移動した問題を削除
        }
        
        choiceQuiz() //問題文を表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func choiceQuiz(){
        //問題文のテキスト表示
        QuizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれのテキストをセット
        choicebutton1.setTitle((quizArray[0][1] as? String), forState: .Normal)
        choicebutton2.setTitle((quizArray[0][2] as? String), forState: .Normal)
        choicebutton3.setTitle((quizArray[0][3] as? String), forState: .Normal)
        
    }
    
    //選択肢のボタンをおした時に呼ばれるメソッド
    @IBAction func choiceAnswer(sender: AnyObject) {
        //正解だった場合
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer += 1
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.removeAtIndex(0)
        
        //説いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            //次の問題へ
            choiceQuiz()
        }
        
    }
    
    //すべての問題を解き終わった時に呼ばれるメソッド
    func performSegueToResult(){
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    //画面遷移するときに自動的に呼ばれるメソッド
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destinationViewController as! ResultViewController
            //遷移先(ResultViewController)のcorrectAnswerに正解数をセット
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    

}
