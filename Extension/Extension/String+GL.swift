//
//  String+GL.swift
//  EagleVision
//
//  Created by apple on 2019/10/30.
//  Copyright © 2019 JAVIS. All rights reserved.
//

extension String
{
    /// 长度
    var length: Int {
        return self.count
    }
    ///
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)), upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension String
{
    /// 保留指定小数位，保留数字后的文字
    ///
    /// - Parameter decimal: 保留位数
    /// - Returns: 指定位数的小数字符串
    func toFloatStr(decimal: Int) -> String {
        // "686.076.5kahf.hfo"
        var a = ""
        var b = ""
        for c in self {
            if (c >= "0" && c <= "9") || c == "." {
                a.append(c)
            } else {
                b = self.substring(fromIndex: a.count)
                break
            }
            
        }
        // a = 686.076.5; b = kahf.hfo"
        let arr = a.components(separatedBy: ".")
        if arr.count == 0 {
            return "" + b
        } else if arr.count == 1 {
            return arr[0] + b
        } else {
            var xiaoshu = arr[1]
            if xiaoshu.count > decimal {
                xiaoshu = xiaoshu.substring(toIndex: decimal)
            }
            a = arr[0] + "." + xiaoshu
            return a + b
        }
    }
}

extension String
{
    func intValue() -> Int {
        let d = Double(self) ?? 0.0
        return Int(d)
    }
}
