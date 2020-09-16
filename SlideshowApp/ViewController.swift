//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Chan Yama on 2020/09/16.
//  Copyright © 2020 moe.hatori2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像表示スペース
    @IBOutlet weak var imageView: UIImageView!
    //スライドショーボタン
    @IBOutlet weak var slideshowButton: UIButton!
    
    
    //配列に指定するindex
    var Nowindex: Int = 0
    
    //スライドショーに使用するタイマー
    var timer: Timer!
    
    //スライドショーさせる画像の配列宣言
    var imageArray:[UIImage] = [
        UIImage(named: "aga1")!,
        UIImage(named: "aga2")!,
        UIImage(named: "aga3")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //スライドショーの処理
    @IBAction func startButton(_ sender: Any) {
        if(timer == nil){
            
            //タイマーのセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            //ボタンの名前を停止に変更する
            slideshowButton.setTitle("停止", for: .normal)
            
        } else {
            
            timer.invalidate()
            timer = nil
            slideshowButton.setTitle("再生", for: .normal)
            
        }
        
    }
    
    //画像の切り替えのための処理
    @objc func changeImage(){
        Nowindex += 1
        
        if(Nowindex == imageArray.count){
            Nowindex = 0
        }
        
        imageView.image = imageArray[Nowindex]
        
    }
    
    //進むボタン
    @IBAction func goButton(_ sender: Any) {
    }
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
    }
    
    
    
}

