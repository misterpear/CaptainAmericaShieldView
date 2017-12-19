//
//  CaptainAmericaShield.swift
//  CaptainAmericaShield
//
//  Created by Patryk Gruszka on 13/12/2017.
//  Copyright © 2017 Patryk Gruszka. All rights reserved.
//

import UIKit

class CaptainAmericaShield: UIView {

    let firstRedCircleLayer: CAShapeLayer
    let whiteCircleLayer: CAShapeLayer
    let secondRedCircleLayer: CAShapeLayer
    let blueCircleLayer: CALayer
    let starLayer: CALayer
    
    override init(frame: CGRect) {
        let itemWidth = frame.height / 10
        let boundsCenter = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        let firstRedCirclePath = UIBezierPath(arcCenter: boundsCenter, radius: itemWidth * 4.5, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        
        // #DB5120
        firstRedCircleLayer = CAShapeLayer()
        firstRedCircleLayer.path = firstRedCirclePath.cgPath
        
        firstRedCircleLayer.fillColor = UIColor.clear.cgColor
        firstRedCircleLayer.strokeColor = UIColor.red.cgColor
        firstRedCircleLayer.lineWidth = itemWidth
        
        let whiteCirclePath = UIBezierPath(arcCenter: boundsCenter, radius: itemWidth * 3.5, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        
        // #FEFEFE
        whiteCircleLayer = CAShapeLayer()
        whiteCircleLayer.path = whiteCirclePath.cgPath
        
        whiteCircleLayer.fillColor = UIColor.clear.cgColor
        whiteCircleLayer.strokeColor = UIColor.white.cgColor
        whiteCircleLayer.lineWidth = itemWidth
        
        let secondRedCirclePath = UIBezierPath(arcCenter: boundsCenter, radius: itemWidth * 2.5, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        
        secondRedCircleLayer = CAShapeLayer()
        secondRedCircleLayer.path = secondRedCirclePath.cgPath
        
        secondRedCircleLayer.fillColor = UIColor.clear.cgColor
        secondRedCircleLayer.strokeColor = UIColor.red.cgColor
        secondRedCircleLayer.lineWidth = itemWidth
        
        // #2987DF
        blueCircleLayer = CALayer()
        blueCircleLayer.frame = CGRect(x: 0, y: 0, width: itemWidth * 4, height: itemWidth * 4)
        blueCircleLayer.cornerRadius = (itemWidth * 4) / 2
        blueCircleLayer.borderWidth = itemWidth
        blueCircleLayer.borderColor = UIColor.blue.cgColor
        
        blueCircleLayer.position = boundsCenter

        starLayer = CALayer()
        starLayer.frame = CGRect(x: 0, y: 0, width: itemWidth * 3, height: itemWidth * 3)
        starLayer.backgroundColor = UIColor.white.cgColor
        
        starLayer.position = boundsCenter
        
        super.init(frame: frame)
        
        layer.addSublayer(firstRedCircleLayer)
        layer.addSublayer(whiteCircleLayer)
        layer.addSublayer(secondRedCircleLayer)
        layer.addSublayer(blueCircleLayer)
        layer.addSublayer(starLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}