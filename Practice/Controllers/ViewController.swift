//
//  ViewController.swift
//  Practice
//
//  Created by Rauan Maksatuly on 11.05.2022.
//

import UIKit

enum State {
    case auth
    case register
    
    mutating func change() {
        switch self {
        case .auth:
            self = .register
        case .register:
            self = .auth
        }
    }
}

class ViewController: UIViewController {
    
    private var state: State = .auth {
        didSet {
            switch state {
            case .auth:
                [nameTextField, surnameTextField].forEach {
                    $0.isHidden = true
                }
                button.setTitle("Auth", for: .normal)
            case .register:
                [nameTextField, surnameTextField].forEach {
                    $0.isHidden = false
                }
                button.setTitle("Register", for: .normal)
            }
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Surname"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var authorizationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textContentType = .password
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupViews()
        state = { state }()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(button.frame)
        print(button.bounds)
    }
    
    @objc private func buttonDidTap() {
        state.change()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        
        [nameTextField, surnameTextField, authorizationTextField, passwordTextField, button].forEach {
            stackView.addArrangedSubview($0)
        }

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            nameTextField.heightAnchor.constraint(equalToConstant: 50),

            surnameTextField.heightAnchor.constraint(equalToConstant: 50),

            authorizationTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
