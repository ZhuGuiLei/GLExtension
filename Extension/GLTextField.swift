//
//  GLTextField.swift
//  EagleVision
//
//  Created by apple on 2019/10/30.
//  Copyright © 2019 JAVIS. All rights reserved.
//

import UIKit

/// 长度限制的TextField
class GLTextField: UITextField {
    
    /// 允许输入最大长度
    @IBInspectable var maxLength: Int = Int(UINT8_MAX)
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.addTarget(self, action: #selector(textFieldEditChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldEditChange(_ textField: UITextField) {
        // 获取高亮部分
        if let selectedRange = textField.markedTextRange {
            if let _ = textField.position(from: selectedRange.start, offset: 0) {
                return
            }
        }
        
        let realLength = textField.text?.count ?? 0
        
        if realLength > maxLength {
            let start = textField.text!.startIndex
            let end = textField.text!.index(start, offsetBy: maxLength)
            textField.text = String(textField.text![start ..< end])
        }
    }
}
