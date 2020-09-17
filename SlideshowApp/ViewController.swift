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
    
    //進むボタン
    @IBOutlet weak var GoButton: UIButton!
    
    //戻るボタン
    @IBOutlet weak var BackButton: UIButton!
    
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
    
    //クリックされた画像のための宣言
    var clickImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //ボタンを丸くする
        slideshowButton.layer.cornerRadius = 10.0
        GoButton.layer.cornerRadius = 10.0
        BackButton.layer.cornerRadius = 10.0
    }
    
//スライドショーの処理
    @IBAction func startButton(_ sender: Any) {
        
        if(timer == nil){
            
            //タイマーのセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            //ボタンの名前を停止に変更する
            slideshowButton.setTitle("停止", for: .normal)
            
            //進む・戻るボタンの無効化
            GoButton.isEnabled = false
            BackButton.isEnabled = false
            
            
        } else {
            
            timer.invalidate()
            timer = nil
            
            //ボタンの名前を再生に変更する
            slideshowButton.setTitle("再生", for: .normal)
            
            //進む・戻るボタンの有効化
            GoButton.isEnabled = true
            BackButton.isEnabled = true
            
        }
        
    }
    
    //スライドショーの画像の切り替えのための処理
    @objc func changeImage(){
        
        
        if(Nowindex == imageArray.count){
            Nowindex = 0
        }
        
        imageView.image = imageArray[Nowindex]
        clickImage = imageArray[Nowindex]
        Nowindex += 1
        
    }
    
//進むボタンを押したときの処理
    @IBAction func goButton(_ sender: Any) {
        
        
        if(Nowindex == imageArray.count){
            Nowindex = 0
        }
        
        //print("print1_\(Nowindex)") //Debug
        
        imageView.image = imageArray[Nowindex]
        clickImage = imageArray[Nowindex]
        Nowindex += 1
        
        //print("print1last_\(Nowindex)") //Debug
    }
    
//戻るボタンを押したときの処理
    @IBAction func backButton(_ sender: Any) {
        
        //Nowindexがさ要素数と一致したとき（今回は３）のときの判定処理
        if(Nowindex == imageArray.count){
            Nowindex = imageArray.count - 1
           // print("print2_\(Nowindex)") //Debug
        }
        
        //Nowindexが０だったときの判定処理
        if (Nowindex == 0){
            imageView.image = imageArray[Nowindex]
            clickImage = imageArray[Nowindex]
            Nowindex = imageArray.count - 1
            //print("print4_\(Nowindex)") //Debug
        }else {
            imageView.image = imageArray[Nowindex]
            clickImage = imageArray[Nowindex]
            Nowindex -= 1
            //print("print5_\(Nowindex)") //Debug
        }
    
    }
    
//画面遷移の処理
    //画像がタッチされたときの処理
    @IBAction func onTapImage(_ sender: Any) {
        
        //print("print5_\(Nowindex)") //Debug
        if timer != nil{
            timer.invalidate()
            timer = nil
            slideshowButton.setTitle("再生", for: .normal)
        }
        
        performSegue(withIdentifier: "toNextViewContoroller",sender: self)
        
        
    }
    
    
    
    //セグエが呼び出される前の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toNextViewContoroller"){
            let next:NextViewController = segue.destination as! NextViewController
            next.selectImage = clickImage
        }
   }
    
    
    //戻ってきたときの処理
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
   
    
    
    
}
