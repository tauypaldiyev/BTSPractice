import UIKit

class PaintControlVC: UIViewController {
    
    public weak var delegate: PaintAreaVC?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func loadView() {
        super.loadView()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .blue
        
        view.addSubview(stackView)
        
        ToolType.allCases.forEach { type in
            let button = createButton(type: type)
            stackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func createButton(type: ToolType) -> UIButton {
        let button = UIButton()
        button.setTitle(type.title, for: .normal)
        button.tag = type.rawValue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard let toolType = ToolType(rawValue: sender.tag) else { return }
        
        delegate?.set(toolType: toolType)
    }
    
}
