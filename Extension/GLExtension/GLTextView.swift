//
//  EVTextView.swift
//  EagleVision
//
//  Created by apple on 2019/11/9.
//  Copyright © 2019 JAVIS. All rights reserved.
//

import UIKit
import SnapKit

protocol GLTextViewDelegate: NSObjectProtocol {
    func textViewDidBeginEditing(_ textView: GLTextView)
    func textViewDidEndEditing(_ textView: GLTextView)
    func textViewDidChange(_ textView: GLTextView)
    func textViewShouldReturn(_ textView: GLTextView)
}
extension GLTextViewDelegate
{
    func textViewDidBeginEditing(_ textView: GLTextView) {}
    func textViewDidEndEditing(_ textView: GLTextView) {}
    func textViewDidChange(_ textView: GLTextView) {}
    func textViewShouldReturn(_ textView: GLTextView) {}
}

class GLTextView: UITextView, UITextViewDelegate {

    /// 代理
    weak var gldelegate: GLTextViewDelegate?
    
    /// text
    var evtext: String! {
        get {
            return text
        }
        set {
            text = newValue
            textViewDidChange(self)
        }
    }
    
    /// 占位label
    private var l_placeholder = UILabel.init()
    /// 数量限制label
    private var l_textCount = UILabel.init()
    
    /// 占位字符串
    @IBInspectable var placeholder: String? {
        get {
            return l_placeholder.text
        }
        set {
            l_placeholder.text = newValue
        }
    }
    
    /// 占位富文本
    var placeholderAttributedText: NSAttributedString? {
        get {
            return l_placeholder.attributedText
        }
        set {
            l_placeholder.attributedText = newValue
        }
    }
    
    /// 不限制输入数量
    @IBInspectable var maxCount: Int = Int(INT16_MAX) {
        didSet {
            textViewDidChange(self)
        }
    }
    
    override func didMoveToSuperview() {
        
        if self.superview == nil {
            return
        }
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        self.delegate = self
        
        self.subviews.first?.clipsToBounds = true
        
        l_textCount.font = UIFont.systemFont(ofSize: 12)
        l_textCount.textColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
        
        l_textCount.removeFromSuperview()
        self.superview!.addSubview(l_textCount)
        
        l_textCount.snp.remakeConstraints { (make) in
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        l_placeholder.textColor = UIColor.init(red: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 1)
        l_placeholder.removeFromSuperview()
        self.superview!.addSubview(l_placeholder)
        l_placeholder.snp.remakeConstraints { (make) in
            make.left.equalTo(self).offset(4)
            make.top.equalTo(self).offset(6)
        }
        
        
    }
    
    /// 输入文本改变
    func textViewDidChange(_ textView: UITextView) {
        /// 输入回车收起键盘
        if textView.returnKeyType == .done || textView.returnKeyType == .send {
            if textView.text.last == "\n" {
                textView.text.removeLast()
                textView.resignFirstResponder()
            }
        }
        /// 占位label是否显示
        l_placeholder.isHidden = !textView.text.isEmpty
        
        /// 是否到达最大数量限制
        if textView.text.count > maxCount {
            let start = textView.text.startIndex
            let end = textView.text.index(start, offsetBy: maxCount)
            textView.text = String(textView.text[start ..< end])
        }
        /// 当前数量显示
        l_textCount.text = "\(textView.text.count)/\(maxCount)"
        
        /// 执行代理
        self.gldelegate?.textViewDidChange(self)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if textView.returnKeyType == .done || textView.returnKeyType == .send {
            if text == "\n" {
                self.gldelegate?.textViewShouldReturn(self)
                textView.resignFirstResponder()
                return false
            }
        }
        return true
    }
    
    /// 开始编辑
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.gldelegate?.textViewDidBeginEditing(self)
    }
    
    /// 结束编辑
    func textViewDidEndEditing(_ textView: UITextView) {
        self.gldelegate?.textViewDidEndEditing(self)
    }
    
    
    override func layoutSubviews() {
        l_placeholder.font = self.font
        
        if maxCount != INT16_MAX {
            self.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 15, right: 0)
            l_textCount.isHidden = false
        } else {
            self.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            l_textCount.isHidden = true
        }
        
    }
    
    deinit {
        print("deinit:\(self)")
    }
    
}
