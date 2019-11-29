//
//  GLTextViewVC.swift
//  Extension
//
//  Created by apple on 2019/11/29.
//  Copyright © 2019 zhuguilei. All rights reserved.
//

import UIKit

class GLTextViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        
        
        let textView = GLTextView.init(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        textView.backgroundColor = UIColor.white
        textView.placeholder = "请输入"
        textView.maxCount = 100
        
        
        
        view.addSubview(textView)
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
