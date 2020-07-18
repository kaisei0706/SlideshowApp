//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岩田海靖 on 2020/07/03.
//  Copyright © 2020 kaisei.iwata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
   

    
    
    var dispImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = [
        "tomneko12151297_TP_V.jpg",
        "Die.jpg",
        "HIR96_nekotawakarakaodakedasite_TP_V.jpg",
        ]
    
    func displayImage() {
        
       

        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "tomneko12151297_TP_V.jpg")
        imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    // 遷移元から遷移先にデータ(画像)を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerのインスタンスを取得する
        let zoomInViewController:ZoomInViewController = segue.destination as!ZoomInViewController
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
            
    // 遷移先のZoomInViewControllerで宣言しているselectedImgに値を代入して渡す
        zoomInViewController.selectedImg = image
    }

    
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var storybutton: UIButton!
    
    @IBAction func onPrev(_ sender: Any) {
        if dispImageNo  >= 1 && dispImageNo  <= imageNameArray.count - 1  {
            //表示している番号の番号を減らす
            dispImageNo -= 1
        
            //表示している画像の番号を元に画像を表示する
            displayImage()
        }  else {
            dispImageNo = imageNameArray.count - 1
            displayImage()
        }
    }

    
    @IBAction func onNext(_ sender: Any) {
        if dispImageNo < imageNameArray.count - 1 {
            //表示している番号の番号を増やす
            dispImageNo += 1
        
            //表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            dispImageNo = 0
            displayImage()
        }
    }
    
    var timer: Timer!
    
    @IBAction func switchButton(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,target: self, selector:#selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextbutton.isEnabled = false
            backbutton.isEnabled = false
            storybutton.setTitle("停止", for: .normal)
            // 背景色・ボタン内テキストサイズを変更
            self.view.backgroundColor = UIColor.lightGray
            storybutton.titleLabel?.font =
            UIFont.systemFont(ofSize: 25)
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
        
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextbutton.isEnabled = true
            backbutton.isEnabled = true
            // ボタンの名前を再生とする
            storybutton.setTitle("再生", for: .normal)
            // 背景色・ボタン内テキストサイズを戻す
            self.view.backgroundColor = UIColor.white
            storybutton.titleLabel?.font =
            UIFont.systemFont(ofSize: 20)
        }
            
    }
        // #selectorで呼び出される関数
        @objc func updateTimer(_ timer: Timer) {
            // 進むボタンの内容を行う
            if dispImageNo < imageNameArray.count - 1 {
                // 表示している画像の番号を1増やす
                dispImageNo += 1
                // 表示している画像の番号を元に画像を表示する
                displayImage()
                print(dispImageNo) // 取得インデックスの確認
            } else {
                dispImageNo = 0
                displayImage()
                print(dispImageNo) // 取得インデックスの確認
            }
        }
    
    @IBAction func onTapAction(_ sender: Any) {
           if self.timer == nil {
               self.performSegue(withIdentifier: "toZoomIn", sender: nil)
           
           } else if self.timer != nil {
               self.performSegue(withIdentifier: "toZoomIn", sender: nil)
            
               // タイマーを停止
               self.timer.invalidate()
               // nil にして再び再生(nil の時にタイマー生成)
               self.timer = nil
               // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
               nextbutton.isEnabled = true
               backbutton.isEnabled = true
               // ボタンの名前を再生とする
               storybutton.setTitle("再生", for: .normal)
               // 背景色・ボタン内テキストサイズを戻す
               self.view.backgroundColor = UIColor.white
               storybutton.titleLabel?.font =
               UIFont.systemFont(ofSize: 20)
            }
    }
    

}
