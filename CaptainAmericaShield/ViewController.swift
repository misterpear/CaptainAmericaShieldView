//
//  ViewController.swift
//  CaptainAmericaShield
//
//  Created by Patryk Gruszka on 13/12/2017.
//  Copyright © 2017 Patryk Gruszka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shieldView: CaptainAmericaShield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let shieldWidth = 300
        
        shieldView = CaptainAmericaShield(frame: CGRect(x: 0, y: 0, width: shieldWidth, height: shieldWidth))
        view.addSubview(shieldView)
        
        shieldView.center = view.center
    }

}

