//
//  StarView.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 12.05.2022.
//

import UIKit

class StarView: UIView {
    
    // MARK: - Lifecycle
    
    override func draw(_ rect: CGRect) {
        let point1 = CGPoint(x: rect.midX, y: 0)
        let point2 = CGPoint(x: rect.width * 0.15 + rect.midX, y: rect.height * 0.38)
        let point3 = CGPoint(x: rect.width, y: point2.y)
        let point4 = CGPoint(x: rect.width * 0.22 + rect.midX, y: rect.height * 0.6)
        let point5 = CGPoint(x: rect.width * 0.35 + rect.midX, y: rect.height)
        let point6 = CGPoint(x: rect.midX, y: rect.height * 0.75)
        
        let path = UIBezierPath()
        
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        path.addLine(to: point5)
        path.addLine(to: point6)
        
        let rotateOrigin = CGAffineTransform(scaleX: -1.0, y: 1.0)
        let translateOrigin = CGAffineTransform(translationX: rect.width, y: 0)

        [rotateOrigin, translateOrigin].forEach {
            path.apply($0)
        }

        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        path.addLine(to: point5)
        path.addLine(to: point6)

        UIColor.blue.setFill()
        path.fill()
    }
    
}
