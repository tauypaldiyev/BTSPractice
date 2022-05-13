//
//  MainViewController.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 12.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func routeToStarView(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StarViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func routeToPaint(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PaintViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
}
