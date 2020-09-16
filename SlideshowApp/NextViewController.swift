//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Chan Yama on 2020/09/16.
//  Copyright © 2020 moe.hatori2. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    //画像の表示スペース
    @IBOutlet weak var sendImage: UIImageView!
    
    //表示する画像のための宣言
    var selectImage: UIImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //画像の表示
        sendImage.image = selectImage
        
        //画像の拡大
        sendImage.contentMode = UIView.ContentMode.scaleAspectFit
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
