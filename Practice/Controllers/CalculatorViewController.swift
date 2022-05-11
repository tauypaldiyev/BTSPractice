//
//  CalculatorViewController.swift
//  Practice
//
//  Created by Rauan Maksatuly on 11.05.2022.
//

import UIKit

enum ButtonType: Int {
    case clear = 0, plusMinus, percentage, divide, seven, eight
    case nine, multiply
}

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidtap(_ sender: UIButton) {
        let tag = sender.tag
        guard
            let type = ButtonType(rawValue: tag),
            let title = resultLabel.text,
            let text = sender.titleLabel?.text
        else { return }
        
        resultLabel.text = "\(title)\(text)"
        switch type {
        case .clear:
            print("AC")
        case .plusMinus:
            navigationController?.popViewController(animated: true)
        case .percentage:
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let controller = storyboard.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController else { return }
            
            present(controller, animated: true)
        default:
            break
//        case .divide:
//            resultLabel.text = "\(text)/"
//        case .seven:
//            resultLabel.text = "\(text)7"
//        case .eight:
//            resultLabel.text = "\(text)8"
//        case .nine:
//            resultLabel.text = "\(text)9"
//        case .multiply:
//            resultLabel.text = "\(text)*"
        }
    }
    
}
