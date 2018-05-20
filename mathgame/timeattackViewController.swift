//
//  timeattackViewController.swift
//  mathgame
//
//  Created by 杉山航 on 2018/03/15.
//  Copyright © 2018年 杉山航. All rights reserved.
//

import UIKit

class timeattackViewController: UIViewController {
    
    @IBOutlet weak var numl_1: UILabel!
    @IBOutlet weak var numl_2: UILabel!
    @IBOutlet weak var numl_3: UILabel!
    @IBOutlet weak var num_answer: UILabel!
    @IBOutlet weak var ruijo_label: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    
    var num_1: UInt64 = 1
    var num_2: UInt64 = 1
    var num_3: UInt64 = 2
    var tmp_answer: UInt64 = 0
    var ruijo_count: Int = 1
    var count: Float = 5.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numl_1.text = String(num_1)
        //        numl_2.text = String(num_2)
        //        let alert:UIAlertController = UIAlertController(title: "ゲームスタート", message: "OKを押すとタイムアタックが始まります", preferredStyle: .alert)
        //        alert.addAction(
        //            UIAlertAction(
        //                title: "OK",
        //                style:.default,
        //                handler: {action in
        //                    //ボタンが押された時の動作
        //                    NSLog("OKが押された")
        //                    if !self.timer.isValid {
        //                        //タイマーが動作していなかったら動かす
        //                        self.timer = Timer.scheduledTimer(
        //                            timeInterval: 0.01,
        //                            target: self,
        //                            selector: #selector(self.up),
        //                            userInfo: nil,
        //                            repeats: true
        //                        )
        //                    }
        //            }
        //            )
        //        )
        //        present(alert, animated: true, completion: nil)
        Swift.print("\n\nhogehoge\n\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func num_typ(sender: AnyObject) {
        if !self.timer.isValid {
            //タイマーが動作していなかったら動かす
            self.timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
        tmp_answer = tmp_answer * 10 + UInt64(sender.tag)
        num_answer.text = String(tmp_answer)
        if tmp_answer == num_3 {
            count += 3.0
            num_1 *= 2
            num_2 *= 2
            num_3 *= 2
            numl_1.text = String(num_1)
            numl_2.text = String(num_2)
            tmp_answer = 0
            num_answer.text = String(tmp_answer)
            ruijo_count += 1
            ruijo_label.text = String(ruijo_count)
        }
        else if num_3 >= 10 {
            
        }
        else {
            let alert:UIAlertController = UIAlertController(title: "不正解！", message: "正解は"+String(num_3)+"", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.num_1 = 1
                        self.num_2 = 1
                        self.num_3 = 2
                        self.numl_1.text = String(self.num_1)
                        self.numl_2.text = String(self.num_2)
                        self.tmp_answer = 0
                        self.num_answer.text = String(self.tmp_answer)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func delete_num(_ sender: Any) {
        tmp_answer = tmp_answer / 10
        num_answer.text = String(tmp_answer)
    }
    @IBAction func clear_num(_ sender: Any) {
        tmp_answer = 0
        num_answer.text = String(tmp_answer)
    }
    @objc func up() {
        //countを0.01（時間経過分）足す
        count = count - 0.01
        //ラベルに小数点以下2桁まで表示
        timelabel.text = String(format: "%.2f", count)
        if count <= 0 {
            if timer.isValid {
                //タイマーが動作していたら停止する
                timer.invalidate()
            }
            let alert:UIAlertController = UIAlertController(title: "時間切れ！", message: "記録は2の"+String(ruijo_count)+"乗 ", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style:.default,
                    handler: {action in
                        //ボタンが押された時の動作
                        NSLog("OKが押された")
                        self.dismiss(animated: true, completion: nil)
                }
                )
            )
            present(alert, animated: true, completion: nil)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
