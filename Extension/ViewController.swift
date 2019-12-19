//
//  ViewController.swift
//  Extension
//
//  Created by apple on 2019/11/29.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
//import ACLabelCounting

class ViewController: UIViewController {

    @IBOutlet weak var lab: ACLabelCounting!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationItem.prompt = " "
        self.navigationItem.title = "title"
        view.backgroundColor = .randomColor()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "首页", style: .plain, target: nil, action: nil)
        let lab = ACLabelCounting.init()
        view.addSubview(lab)
        lab.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        self.lab = lab
        
        
    }
    
    @IBAction func date(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func textView(_ sender: Any) {
        let vc = GLTextViewVC.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func iadAction(_ sender: UIButton) {
        let vc = GLTopADVC.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func admobAction(_ sender: UIButton) {
        lab.count(from: 0, to: 999, duration: 3, animationType: .EaseInOut, dataType: .Int) { (tit) -> String in
            
            return (tit == "999") ? (tit + "+") : tit
        }

        lab.start()
//        let vc = GLAdmobVC.init()
//        self.navigationController?.pushViewController(vc, animated: true)
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
