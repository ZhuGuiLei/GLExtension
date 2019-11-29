//
//  EVUtils.swift
//  EagleVision
//
//  Created by apple on 2019/9/18.
//  Copyright © 2019 JAVIS. All rights reserved.
//

import UIKit
import AdSupport


let Hi: CGFloat = UIScreen.main.bounds.size.height
let Wi: CGFloat = UIScreen.main.bounds.size.width

let Hs: CGFloat = UIApplication.shared.statusBarFrame.size.height

let Hn: CGFloat = (Hs + 44)

var Hb: CGFloat {
    get {
        if #available(iOS 11.0, *) {
            return GLWindow?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
}

let Htb: CGFloat = (Hb + 49)


let GLSafeSide = CGFloat(isIphoneX ? 20 : 16)

let GLScreenScale = (UIScreen.main.scale)


/// 当前AppDelegate
let GLAppDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate

/// 主窗口
let GLWindow: UIWindow? = GLAppDelegate?.window


/// 类型别名
typealias BaseBlock = (() -> Void)
typealias BaseTypeBlock<T> = ((_ sender: T) -> Void)



//iPhoneX系列
var isIphoneX: Bool {
    get {
        if #available(iOS 11.0, *) {
            if let bottom = GLWindow?.safeAreaInsets.bottom , bottom > 0 {
                return true
            }
        } else {
            DLog("iOS11 之前的版本")
        }
        return false
    }
}

/// 隐藏键盘
func KeyboardHide() {
    UIApplication.shared.keyWindow?.endEditing(true)
}


struct AppInfo {
    
    static let infoDictionary = Bundle.main.infoDictionary
    
    /// App 名称
    static let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    
    /// Bundle Identifier
    static let bundleIdentifier: String = Bundle.main.bundleIdentifier!
    
    /// App 版本号
    static let appVersion: String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String
    
    /// Bulid 版本号
    static let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String
    
    
    /// 设备 udid
    static let identifierNumber = UIDevice.current.identifierForVendor?.uuidString
    
    /// 设备名称
    static let systemName = UIDevice.current.systemName
    
    /// 设备版本
    static let systemVersion:String = UIDevice.current.systemVersion
    
    /// 设备型号
    static let model = UIDevice.current.model
    
    /// 设备区域化型号
    static let localizedModel = UIDevice.current.localizedModel
    
    /// 设备语言
    static let localLanguage = (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray).object(at: 0)
    
    /// 广告标识
    static let identifierForAdvertising = ASIdentifierManager.shared().advertisingIdentifier.uuidString
    
    /// App 版本号
    static var appIntVersion: Int {
        let arr = appVersion.components(separatedBy: ".")
        var v = 0
        for str in arr {
            v = v * 100 + (Int(str) ?? 0)
        }
        return v
    }
}


/// 打电话
///
/// - Parameter phone: 电话号码
func Call(phone: String?) {
    if phone == nil  {
        DLog("号码为空")
        return
    }
    if phone!.count <= 2 {
        DLog("号码为空\(phone ?? "")")
        return
    }
    DLog("call:" + phone!)
    let phone = "telprompt://" + phone!
    if UIApplication.shared.canOpenURL(URL(string: phone)!) {
        UIApplication.shared.openURL(URL(string: phone)!)
    }
    
}


#if DEBUG

func DLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    print(items, separator: separator, terminator: terminator)
}

#else

func DLog(_ items: Any..., separator: String = " ", terminator: String = "\n") {}

#endif


