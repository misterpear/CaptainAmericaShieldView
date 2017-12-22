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
        
        // #DB5120
        firstRedCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 4.5, lineWidth: itemWidth, color: .red)
        
        // #FEFEFE
        whiteCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 3.5, lineWidth: itemWidth, color: .white)
        
        secondRedCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 2.5, lineWidth: itemWidth, color: .red)
        
        // #2987DF
        blueCircleLayer = CALayer()
        blueCircleLayer.frame = CGRect(x: 0, y: 0, width: itemWidth * 4, height: itemWidth * 4)
        blueCircleLayer.cornerRadius = (itemWidth * 4) / 2
        blueCircleLayer.borderWidth = itemWidth
        blueCircleLayer.borderColor = UIColor.blue.cgColor
        blueCircleLayer.backgroundColor = UIColor.blue.cgColor
        blueCircleLayer.position = boundsCenter

        let starLayerFrame = CGRect(x: 0, y: 0, width: itemWidth * 4, height: itemWidth * 4)
        starLayer = CaptainAmericaShield.starWithFivePoints(frame: starLayerFrame)
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

extension CaptainAmericaShield {
    
    static func circleLayer(center: CGPoint, radius: CGFloat, lineWidth: CGFloat, color: UIColor) -> CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: false)
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = color.cgColor
        circleLayer.lineWidth = lineWidth
        
        return circleLayer
    }
    
    func star(withPoint point: Int) -> CAShapeLayer {
        
        return CAShapeLayer()
    }
    
    static func starWithFivePoints(frame: CGRect) -> CAShapeLayer {
        let numberOfPoints = 5
        
        let angle = Double.pi * 2 / Double(numberOfPoints)
        let radius = Double(frame.width / 2)
        
        let centerX = Double(frame.width / 2)
        let centerY = Double(frame.width / 2)
        
        let originAngle = Double.pi / 2
        let originX = centerX + radius * -cos(originAngle)
        let originY = centerY + radius * -sin(originAngle)
        let originPoint = CGPoint(x: originX, y: originY)
        
        let path = CGMutablePath()
        path.move(to: originPoint)
        
        for i in 1...numberOfPoints {
            let newAngle = angle * Double(i) * 2 + originAngle
            
            let x = centerX - radius * cos(newAngle)
            let y = centerY - radius * sin(newAngle)
            
            let nextPoint = CGPoint(x: x, y: y)
            
            path.addLine(to: nextPoint)
        }
        
        let starLayer = CAShapeLayer()
        starLayer.frame = frame
        starLayer.path = path
        starLayer.fillColor = UIColor.white.cgColor
        
        return starLayer
    }
    
}
