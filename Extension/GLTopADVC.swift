//
//  GLTopADVC.swift
//  Extension
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 zhuguilei. All rights reserved.
//

import UIKit
import iAd

class GLTopADVC: UIViewController {

    lazy var v_ad: ADBannerView = {
        let view = ADBannerView.init(adType: .banner)!
        view.y = 100
        view.delegate = self
        return view
    }()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "AD"
        view.backgroundColor = UIColor.cyan
        view.addSubview(v_ad)
        //手机强制横屏方法
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }

}

extension GLTopADVC: ADBannerViewDelegate
{
    func bannerViewWillLoadAd(_ banner: ADBannerView) {
        print(#function)
    }
    
    func bannerViewDidLoadAd(_ banner: ADBannerView) {
        print(#function)
    }

    func bannerView(_ banner: ADBannerView, didFailToReceiveAdWithError error: Error) {
        print(#function)
    }

    func bannerViewActionShouldBegin(_ banner: ADBannerView, willLeaveApplication willLeave: Bool) -> Bool {
        print(#function)
        return true
    }

    func bannerViewActionDidFinish(_ banner: ADBannerView) {
        print(#function)
    }
}
