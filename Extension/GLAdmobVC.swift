//
//  GLAdmobVC.swift
//  Extension
//
//  Created by apple on 2019/12/13.
//  Copyright © 2019 zhuguilei. All rights reserved.
//

import UIKit

class GLAdmobVC: UIViewController {

    var bannerView: GADBannerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Admob"
        view.backgroundColor = UIColor.cyan
        
        let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 50))
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.rootViewController = self
        // Set the ad unit ID to your own ad unit ID here.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.load(GADRequest())
        bannerView.delegate = self

        view.addSubview(bannerView)
    }

    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
        bannerView.alpha = 0
        view.addSubview(bannerView)
        UIView.animate(withDuration: 1, animations: {
          bannerView.alpha = 1
        })

    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }

}
