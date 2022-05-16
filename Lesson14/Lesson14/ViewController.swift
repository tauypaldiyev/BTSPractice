//
//  ViewController.swift
//  Lesson14
//
//  Created by Rauan Maksatuly on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {

    private var startingConstant: CGFloat  = 0.0
    
    private var separatorViewBottomConstraint: NSLayoutConstraint = .init()
    
    private lazy var paintAreaVC = PaintAreaVC()
    
    private lazy var paintControlVC: PaintControlVC = {
        let controller = PaintControlVC()
        controller.delegate = paintAreaVC
        return controller
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized)))
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var customView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 400, height: 400))
        view.backgroundColor = .systemPink
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .green
        setupControllers()
        setupViews()
        setupConstraints()
        
        view.addSubview(customView)
        
        customView.frame = CGRect(x: 100, y: 100, width: 100, height: 500)
        
        print("Frame: \(customView.frame)")
        print("Bounds: \(customView.bounds)")
    }
    
    private func setupControllers() {
        [paintAreaVC, paintControlVC].forEach {
            addChild($0)
        }
    }
    
    private func setupViews() {
        [paintAreaVC.view, paintControlVC.view, separatorView].compactMap { $0 }.forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
    }
    
    private func setupConstraints() {
        separatorViewBottomConstraint = separatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        
        NSLayoutConstraint.activate([
            paintAreaVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            paintAreaVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paintAreaVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paintAreaVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 10),
            separatorViewBottomConstraint,
            
            paintControlVC.view.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            paintControlVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paintControlVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paintControlVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            startingConstant = separatorViewBottomConstraint.constant
        case .changed:
            let translation = sender.translation(in: self.view)
            print(translation.y)
            separatorViewBottomConstraint.constant = startingConstant + translation.y
        default:
            break
        }
    }

}

