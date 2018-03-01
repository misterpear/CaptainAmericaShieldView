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
        
        let palette = CaptainAmericaShield.Palette(firstCircleColor: .green, secondCircleColor: .orange, thirdCircleColor: .green, fourthCircleColor: .purple)
        let frame = CGRect(x: 0, y: 0, width: shieldWidth, height: shieldWidth)
        
        shieldView = CaptainAmericaShield(frame: frame, palette: palette)
        view.addSubview(shieldView)
        
        shieldView.center = view.center
        
//        addDebug()
    }
    
    func addDebug() {
        let viewWidth = UIScreen.main.bounds.width
        let viewHeight = UIScreen.main.bounds.height
        
        // For Debug.
        let shieldBackground = UIView(frame: shieldView.frame)
        shieldBackground.backgroundColor = .yellow
        view.insertSubview(shieldBackground, belowSubview: shieldView)
        
        // Black line.
        let lineHeight = Int(shieldView.frame.width)
        let maxLine = 10
        
        for n in 0...maxLine {
            let line = UIView(frame: CGRect(x: n * (lineHeight / maxLine), y: 0, width: 1, height: lineHeight))
            line.backgroundColor = .black
            shieldView.addSubview(line)
        }
        
        // Red line.
        let lineHorizontal = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 1))
        lineHorizontal.backgroundColor = UIColor.cyan
        
        view.addSubview(lineHorizontal)
        
        let lineVertical = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: viewHeight))
        lineVertical.backgroundColor = UIColor.cyan
        
        view.addSubview(lineVertical)
        
        lineHorizontal.center = view.center
        lineVertical.center = view.center
    }

}

