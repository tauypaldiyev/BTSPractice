//
//  PaintViewController.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 12.05.2022.
//

import UIKit

class PaintViewController: UIViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var customView: PaintView!
    
    // MARK: - Methods
    
    @IBAction func shapePressed(_ sender: UIButton) {
        guard let toolType = ToolType(rawValue: sender.tag) else { return }
        
        customView.toolType = toolType
    }
    
}
