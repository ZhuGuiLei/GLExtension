//
//  Method.swift
//  GLTabNav
//
//  Created by apple on 2019/11/22.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

protocol MethodProtocol: NSObjectProtocol {
    static func initializeMethod()
    static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector)
}

extension MethodProtocol {
    
    static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(forClass, originalSelector) else { return }
        guard let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) else { return }
        
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}

class Method {
    // 获取到所有的类，遍历类，遵守协议MethodProtocol的类执行initializeMethod方法
    static func performOnce() {
        let count = Int(objc_getClassList(nil, 0))
        let classes = UnsafeMutablePointer<AnyClass?>.allocate(capacity: count)
        let autoreleaseClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(classes)
        objc_getClassList(autoreleaseClasses, Int32(count))
        for index in 0..<count {
            (classes[index] as? MethodProtocol.Type)?.initializeMethod()
        }
        classes.deallocate()
    }
}


extension UIApplication {
    private static let runOnce: Void = {
//        Method.performOnce()
        UIViewController.initializeMethod()
    }()

    private static var once = true

    override open var next: UIResponder? {
        if UIApplication.once {
            UIApplication.once = false
            UIApplication.runOnce
        }
        return super.next
    }
}
