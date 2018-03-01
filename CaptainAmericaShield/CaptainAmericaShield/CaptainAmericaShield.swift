//
//  CaptainAmericaShield.swift
//  CaptainAmericaShield
//
//  Created by Patryk Gruszka on 13/12/2017.
//  Copyright © 2017 Patryk Gruszka. All rights reserved.
//

import UIKit

class CaptainAmericaShield: UIView {
    
    struct Palette {
        let firstCircleColor: UIColor
        let secondCircleColor: UIColor
        let thirdCircleColor: UIColor
        let fourthCircleColor: UIColor
        let starColor: UIColor
        
        init(firstCircleColor: UIColor = .red, secondCircleColor: UIColor = .white, thirdCircleColor: UIColor = .red, fourthCircleColor: UIColor = .blue, starColor: UIColor = .white) {
            self.firstCircleColor = firstCircleColor
            self.secondCircleColor = secondCircleColor
            self.thirdCircleColor = thirdCircleColor
            self.fourthCircleColor = fourthCircleColor
            self.starColor = starColor
        }
    }

    let firstCircleLayer: CAShapeLayer
    let secondCircleLayer: CAShapeLayer
    let thirdCircleLayer: CAShapeLayer
    let fourthCircleLayer: CALayer
    let starLayer: CAShapeLayer
    
    override init(frame: CGRect) {
        let itemWidth = frame.height / 10
        let boundsCenter = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        // #DB5120
        firstCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 4.5, lineWidth: itemWidth, color: .red)
        
        // #FEFEFE
        secondCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 3.5, lineWidth: itemWidth, color: .white)
        
        thirdCircleLayer = CaptainAmericaShield.circleLayer(center: boundsCenter, radius: itemWidth * 2.5, lineWidth: itemWidth, color: .red)
        
        // #2987DF
        fourthCircleLayer = CALayer()
        fourthCircleLayer.frame = CGRect(x: 0, y: 0, width: itemWidth * 4, height: itemWidth * 4)
        fourthCircleLayer.cornerRadius = (itemWidth * 4) / 2
        fourthCircleLayer.borderWidth = itemWidth
        fourthCircleLayer.borderColor = UIColor.blue.cgColor
        fourthCircleLayer.backgroundColor = UIColor.blue.cgColor
        fourthCircleLayer.position = boundsCenter

        let starLayerFrame = CGRect(x: 0, y: 0, width: itemWidth * 4, height: itemWidth * 4)
        starLayer = CaptainAmericaShield.starWithFivePoints(frame: starLayerFrame)
        starLayer.position = boundsCenter
        
        super.init(frame: frame)
        
        layer.addSublayer(firstCircleLayer)
        layer.addSublayer(secondCircleLayer)
        layer.addSublayer(thirdCircleLayer)
        layer.addSublayer(fourthCircleLayer)
        layer.addSublayer(starLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, palette: Palette) {
        self.init(frame: frame)
        
        firstCircleLayer.strokeColor = palette.firstCircleColor.cgColor
        secondCircleLayer.strokeColor = palette.secondCircleColor.cgColor
        thirdCircleLayer.strokeColor = palette.thirdCircleColor.cgColor
        fourthCircleLayer.backgroundColor = palette.fourthCircleColor.cgColor
        fourthCircleLayer.borderColor = palette.fourthCircleColor.cgColor
        starLayer.fillColor = palette.starColor.cgColor
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
    
    static func starLayer(with points: Int, frame: CGRect) -> CAShapeLayer {
        
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
