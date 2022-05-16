import UIKit

protocol PaintAreaVCDelegate {
    func set(toolType: ToolType)
}

class PaintAreaVC: UIViewController {

    private lazy var paintView = PaintView()
    
    public var pop = 23
    
    override func loadView() {
        view = paintView
    }
    
}

extension PaintAreaVC: PaintAreaVCDelegate {
    
    func set(toolType: ToolType) {
        paintView.toolType = toolType
    }
    
}
