//
//  PaintControlViewController.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 15.05.2022.
//

import UIKit

class PaintControlViewController: UIViewController {
    
    // MARK: - Methods
    
    @IBAction func shapePressed(_ sender: UIButton) {
        guard
            let toolType = ToolType(rawValue: sender.tag),
            let parent = parent as? PaintViewController
        else { return }
        
        parent.paintAreaController?.painView.toolType = toolType
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        guard let controller = parent as? PaintViewController
        else { return }
        
        controller.paintAreaController?.painView.undo()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        guard let controller = parent as? PaintViewController
        else { return }
        
        controller.paintAreaController?.painView.isFilled = sender.isOn
    }
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        guard
            let colorType = ColorType(rawValue: sender.tag),
            let parent = parent as? PaintViewController
        else { return }
        
        parent.paintAreaController?.painView.colorType = colorType
    }
    
}
