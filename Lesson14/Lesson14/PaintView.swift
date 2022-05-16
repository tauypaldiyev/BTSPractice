import UIKit

enum ToolType: Int, CaseIterable {
    case circle = 0, triangle, rectangle, pen
    
    var title: String {
        switch self {
        case .circle:
            return "Circle"
        case .triangle:
            return "Triangle"
        case .rectangle:
            return "Rectangle"
        case .pen:
            return "Pen"
        }
    }
}

class PaintView: UIView {
    
    // MARK: - Properties
    
    var toolType: ToolType = .pen
    private var shapes: [UIBezierPath] = []
    private var initialPoint: CGPoint?
    private var initPoint: CGPoint?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func draw(_ rect: CGRect) {
        for shape in shapes {
            UIColor.blue.set()
            shape.lineWidth = 2.0
            shape.fill()
            shape.stroke()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initialPoint = touches.first?.location(in: self)
        initPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard
            let animatePoint = touches.first?.location(in: self),
            let initPoint = initPoint
        else { return }
        
        if toolType == .pen {
            drawAnimatedWithPen(initPoint, animatePoint)
            self.initPoint = animatePoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard
            let endPoint = touches.first?.location(in: self),
            let initialPoint = initialPoint
        else { return }
        
        switch toolType {
        case .circle:
            drawCircle(initialPoint, endPoint)
        case .rectangle:
            drawRectangle(initialPoint, endPoint)
        case .triangle:
            drawTriangle(initialPoint, endPoint)
        case .pen:
            break
        }
    }
    
    // MARK: - Methods
    
    public func undo() {
        shapes.removeLast()
        setNeedsDisplay()
    }
    
    private func drawCircle(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
        let circleCenter = CGPoint(
            x: (firstPoint.x + secondPoint.x) / 2,
            y: (firstPoint.y + secondPoint.y) / 2
        )
        let deltaX = secondPoint.x - firstPoint.x
        let deltaY = secondPoint.y - firstPoint.y
        let circleRadius: CGFloat = sqrt(deltaX * deltaX + deltaY * deltaY) / 2
        let circle = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadius,
            startAngle: 0.0,
            endAngle: CGFloat(2 * Double.pi),
            clockwise: false
        )
        shapes.append(circle)
        setNeedsDisplay()
    }
    
    private func drawRectangle(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
        let originPoint = CGPoint(
            x: firstPoint.x,
            y: firstPoint.y
        )
        let rectSize = CGSize(
            width: (secondPoint.x - firstPoint.x),
            height: (secondPoint.y - firstPoint.y)
        )
        let aRectangle = CGRect(origin: originPoint, size: rectSize)
        let rectangle = UIBezierPath(rect: aRectangle)
        shapes.append(rectangle)
        setNeedsDisplay()
    }
    
    private func drawTriangle(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: firstPoint.x, y: firstPoint.y))
        triangle.addLine(to: CGPoint(x: firstPoint.x, y: secondPoint.y))
        triangle.addLine(to: CGPoint(x: secondPoint.x, y: secondPoint.y))
        shapes.append(triangle)
        setNeedsDisplay()
    }
    
    private func drawAnimatedWithPen(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
        let line = UIBezierPath()
        line.move(to: firstPoint)
        line.addLine(to: secondPoint)
        shapes.append(line)
        setNeedsDisplay()
    }
    
}
