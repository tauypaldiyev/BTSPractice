//
//  ViewController.swift
//  Practice
//
//  Created by Rauan Maksatuly on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    
    private let colors: [UIColor] = [.red, .yellow, .gray, .blue, .brown]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gestureRecognized(_ sender: UIPanGestureRecognizer) {
        guard let v = sender.view else { return }

        switch sender.state {
        case .began, .changed:
            let delta = sender.translation(in: v.superview)
            var center = v.center
            center.x += delta.x
            center.y += delta.y
            v.center = center
            sender.setTranslation(.zero, in: v.superview)
        default:
            break
        }
    }
    
    @IBAction func tapGestureRewcognized(_ sender: UITapGestureRecognizer) {
        print("Tap")
        guard let v = sender.view as? CustomView else { return }
        
        v.contentView.backgroundColor = colors.randomElement()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController else { return }
        
        present(controller, animated: true)
    }
}
