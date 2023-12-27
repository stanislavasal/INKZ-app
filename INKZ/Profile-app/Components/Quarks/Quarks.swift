//
//  Quarks.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 26/12/2023.
//
import UIKit

struct Q_FilterArrowStyles {
    struct Sizes {
        static let width: CGFloat = 20.0
        static let height: CGFloat = 17.2
    }
}

class ShortButtonView: UIView {
    
    // MARK: - Properties
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Q_AllWorksCategoryPage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = A_ButtonStyles.CornerRadius.cornerRadius
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        // Background color for the block
        backgroundColor = UIColor.green
        
        // Add button to the view
        addSubview(button)
        
        // Constraints for the button
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: A_ButtonStyles.Sizes.widthShort),
            button.heightAnchor.constraint(equalToConstant: A_ButtonStyles.Sizes.height),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
