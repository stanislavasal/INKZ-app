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

struct Q_ArticleImageStyles {
    struct Sizes {
        static let width: CGFloat = 149.0
        static let height: CGFloat = 149.0
        static let cornerRadius: CGFloat = 10.0
    }
}

struct Q_ArrowButtonStyles {
    struct Sizes {
        static let width: CGFloat = 35.0
        static let height: CGFloat = 35.0
        static let cornerRadius: CGFloat = 10.0
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

class W_SeeAllWorksCard: UIView {
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "Q_AllWorksCategoryPage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = A_ButtonStyles.Colors.backgroundColor
        button.setTitleColor(A_ButtonStyles.Colors.textColor, for: .normal)
        button.layer.cornerRadius = A_ButtonStyles.CornerRadius.cornerRadius
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Посмотреть все работы", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: A_ButtonStyles.Sizes.fontSize)
        button.contentMode = .scaleAspectFit
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(imageView)
        addSubview(button)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 375),

            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: A_ButtonStyles.Sizes.height),
            button.widthAnchor.constraint(equalToConstant: A_ButtonStyles.Sizes.widthShort)
        ])

        backgroundColor = UIColor.white
        layer.cornerRadius = 20
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.black.cgColor
    }
}

class BasicArticlesCategoryPage: UIView {
    let greenContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black // Change background color to black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20 // Add rounded corners
        return view
    }()
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Q_ArticleImageStyles.Sizes.cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Q_ArrowButton"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
//    let bodyTextLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = A_BodyTextStyles.Font.textFont
//        label.textColor = A_BodyTextStyles.Color.textColorWhite
//        label.numberOfLines = 0 // Allow multiple lines
//        label.lineBreakMode = .byWordWrapping // Enable word wrapping
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(greenContainerView)
        greenContainerView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        greenContainerView.heightAnchor.constraint(equalToConstant: 189).isActive = true
        
        greenContainerView.addSubview(articleImageView)
        articleImageView.topAnchor.constraint(equalTo: greenContainerView.topAnchor, constant: 20).isActive = true
        articleImageView.leadingAnchor.constraint(equalTo: greenContainerView.leadingAnchor, constant: 20).isActive = true
        articleImageView.widthAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.width).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.height).isActive = true
        
        addSubview(arrowButton)
        arrowButton.bottomAnchor.constraint(equalTo: greenContainerView.bottomAnchor, constant: -20).isActive = true
        arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        arrowButton.widthAnchor.constraint(equalToConstant: Q_ArrowButtonStyles.Sizes.width).isActive = true
        arrowButton.heightAnchor.constraint(equalToConstant: Q_ArrowButtonStyles.Sizes.height).isActive = true
        
//        addSubview(bodyTextLabel)
//        bodyTextLabel.topAnchor.constraint(equalTo: greenContainerView.topAnchor, constant: 20).isActive = true
//        bodyTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//        bodyTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class W_ArticlesCategoryPage1: BasicArticlesCategoryPage {

    let bodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = A_BodyTextStyles.Font.textFont
        label.textColor = A_BodyTextStyles.Color.textColorWhite
        label.text = A_BodyTextStyles.Text.textArticle1
        label.numberOfLines = 0 // Allow multiple lines
        label.lineBreakMode = .byWordWrapping // Enable word wrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let image = UIImage(named: "Q_ArticleImage") {
            articleImageView.image = image
        } else {
            // Handle the case when the image is not found
            print("Image not found in assets")
        }
        addSubview(bodyTextLabel)
        bodyTextLabel.topAnchor.constraint(equalTo: greenContainerView.topAnchor, constant: 20).isActive = true
        bodyTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        bodyTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class W_ArticlesCategoryPage2: BasicArticlesCategoryPage {

    let bodyTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = A_BodyTextStyles.Font.textFont
        label.textColor = A_BodyTextStyles.Color.textColorWhite
        label.text = A_BodyTextStyles.Text.textArticle2
        label.numberOfLines = 0 // Allow multiple lines
        label.lineBreakMode = .byWordWrapping // Enable word wrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let image = UIImage(named: "Q_ArticleImage") {
            articleImageView.image = image
        } else {
            // Handle the case when the image is not found
            print("Image not found in assets")
        }
        addSubview(bodyTextLabel)
        bodyTextLabel.topAnchor.constraint(equalTo: greenContainerView.topAnchor, constant: 20).isActive = true
        bodyTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        bodyTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 130).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
