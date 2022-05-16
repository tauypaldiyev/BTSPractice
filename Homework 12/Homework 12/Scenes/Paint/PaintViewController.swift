//
//  PaintViewController.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 12.05.2022.
//

import UIKit

enum SegueType: String {
    case area = "toPaintArea"
    case control = "toControlArea"
}

class PaintViewController: UIViewController {
    
    @IBOutlet weak var separatorViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView: UIView!
    
    public weak var paintAreaController: PaintAreaViewController?
    public weak var paintControlController: PaintControlViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueType = SegueType(rawValue: segue.identifier ?? "") else { return }
        
        switch segueType {
        case .area:
            guard let controller = segue.destination as? PaintAreaViewController else { return }
            
            paintAreaController = controller
        case .control:
            guard let controller = segue.destination as? PaintControlViewController else { return }
            
            paintControlController = controller
        }
    }
    
    var startingConstant: CGFloat  = 0.0
    
    @IBAction func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            startingConstant = separatorViewBottomConstraint.constant
        case .changed:
            let translation = sender.translation(in: self.view)
            print(translation.y)
            separatorViewBottomConstraint.constant = startingConstant - translation.y
        default:
            break
        }
    }
    
}
