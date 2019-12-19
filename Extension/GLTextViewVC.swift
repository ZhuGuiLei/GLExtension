//
//  GLTextViewVC.swift
//  Extension
//
//  Created by apple on 2019/11/29.
//  Copyright © 2019 zhuguilei. All rights reserved.
//

import UIKit

class GLTextViewVC: UIViewController, GLTextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        
        
        let textView = GLTextView.init(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        textView.backgroundColor = UIColor.white
        textView.placeholder = "请输入"
        textView.maxCount = 100
        textView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textView.gldelegate = self
        
        view.addSubview(textView)
    }
    
    func textViewDidChange(_ textView: GLTextView) {
        print("isValid          \(textView.text.isValid())")
        print("isValidTelNum    \(textView.text.isValidTelNum(showAlert: false))")
        print("isValidIdCard    \(textView.text.isValidIdCard())")
        print("isValidBankCardNumber\(textView.text.isValidBankCardNumber())")
        print("isValidEmail     \(textView.text.isValidEmail())")
        print("isValidUrl       \(textView.text.isValidUrl())")
        print("isValidVerifyCode\(textView.text.isValidVerifyCode())")
        print("isValidRealName  \(textView.text.isValidRealName())")
        print("validateNickName \(textView.text.validateNickName())")
        print("isValidChinese   \(textView.text.isValidChinese())")
        print("isValidNumber    \(textView.text.isValidNumber())")
        print("isValidDecimalNumber\(textView.text.isValidDecimalNumber())")
        print("isValidSafePassword\(textView.text.isValidSafePassword())")
        print("\n")
    
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
