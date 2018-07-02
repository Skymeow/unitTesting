//
//  ViewController.swift
//  testOpenLink
//
//  Created by Sky Xu on 4/4/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit
import Foundation
import WebKit
class ViewController: UIViewController, OpenedViewDelegate {

    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    @IBOutlet weak var viewBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewBtn.addTarget(self, action: #selector(dismissed), for: .touchUpInside)
    }

    @IBAction func openPodcast(_ sender: UIButton) {
        let vc = YoutubeViewController()
        vc.openedViewdelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func dismissed() {
        centerX.constant = -400
    }
    
    func changeXis() {
        centerX.constant = 0
    }
//    let url = URL(string: "https://itunes.apple.com/us/podcast/sleep-and-relax-asmr/id1133320064?mt=2&i=10003989096")!
//    UIApplication.shared.open(url, options: [:]) { (success) in
//    if success {
//    print("opened")
//    }
//    }
}

