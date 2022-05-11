//
//  CustomView.swift
//  Practice
//
//  Created by Rauan Maksatuly on 11.05.2022.
//

import UIKit

class CustomView: UIView {

    private let topPadding: CGFloat = 10

    private let leftPadding: CGFloat = 10

    private let rightPadding: CGFloat = 10

    private let bottomPadding: CGFloat = 10

    private let cornerRadius: CGFloat = 10
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Moved")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Cancelled")
    }
    
    override public func draw(_ rect: CGRect) {
        UIRectFill(rect)

        let bigPath = UIBezierPath(rect: rect)
        let smallPath = UIBezierPath()

        smallPath.move(to: CGPoint(
            x: rect.minX + leftPadding + cornerRadius,
            y: rect.minY + topPadding
        ))
        smallPath.addArc(
            withCenter: CGPoint(
                x: rect.width - rightPadding - cornerRadius,
                y: rect.minY + topPadding + cornerRadius
            ),
            radius: cornerRadius,
            startAngle: -(.pi / 2),
            endAngle: 0,
            clockwise: true
        )
        smallPath.addLine(to: CGPoint(
            x: rect.width - rightPadding,
            y: rect.height - bottomPadding - cornerRadius
        ))
        smallPath.addArc(
            withCenter: CGPoint(
                x: rect.width - rightPadding - cornerRadius,
                y: rect.height - bottomPadding - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: 0,
            endAngle: .pi / 2,
            clockwise: true
        )
        smallPath.addLine(to: CGPoint(
            x: rect.minX + leftPadding + cornerRadius,
            y: rect.height - bottomPadding
        ))
        smallPath.addArc(
            withCenter: CGPoint(
                x: rect.minX + leftPadding + cornerRadius,
                y: rect.height - bottomPadding - cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .pi / 2,
            endAngle: .pi,
            clockwise: true
        )
        smallPath.addLine(to: CGPoint(
            x: rect.minX + leftPadding,
            y: rect.minY + topPadding + cornerRadius
        ))
        smallPath.addArc(
            withCenter: CGPoint(
                x: rect.minX + leftPadding + cornerRadius,
                y: rect.minY + topPadding + cornerRadius
            ),
            radius: cornerRadius,
            startAngle: .pi,
            endAngle: 3 * .pi / 2,
            clockwise: true
        )
        bigPath.append(smallPath)

        let fillLayer = CAShapeLayer()
        fillLayer.path = bigPath.cgPath
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        layer.mask = fillLayer
    }

}
