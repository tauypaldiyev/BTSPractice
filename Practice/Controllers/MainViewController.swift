//
//  MainViewController.swift
//  Practice
//
//  Created by Rauan Maksatuly on 13.05.2022.
//

import UIKit

enum SegueType: String {
    case first = "routeToFirstVC"
}

class MainViewController: UIViewController {
    
    // MARK: - Proeprties
    
    let secondVC = SecondViewController()
    let thirdVC = ThirdViewController()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSecondVC()
        addThirdVC()
    }
    
    private func addSecondVC() {
        secondVC.view.backgroundColor = .brown
        addChild(secondVC)
        view.addSubview(secondVC.view)
        
        secondVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            secondVC.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        secondVC.didMove(toParent: self)
    }
    
    private func addThirdVC() {
        addChild(thirdVC)
        view.addSubview(thirdVC.view)
        
        thirdVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            thirdVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            thirdVC.view.bottomAnchor.constraint(equalTo: secondVC.view.topAnchor),
            thirdVC.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        thirdVC.didMove(toParent: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case SegueType.first.rawValue:
            guard let controller = segue.destination as? FirstVC else { return }
                
            controller.view.backgroundColor = .blue
        default:
            break
        }
    }


}
