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

class W_ArticlesCategoryPage: UIView {

    // Большая картинка
    let bigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.green
        imageView.layer.cornerRadius = Q_ArticleImageStyles.Sizes.cornerRadius
        return imageView
    }()

    // Текст
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = A_ButtonStyles.Color.textColorWhite
        label.font = UIFont.systemFont(ofSize: A_ButtonStyles.Sizes.fontSize)
        label.textAlignment = .right
        return label
    }()

    // Маленькая картинка
    let smallImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.green
        imageView.layer.cornerRadius = Q_ArticleImageStyles.Sizes.cornerRadius
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Устанавливаем фон
        backgroundColor = UIColor.green

        // Добавляем элементы на экран
        addSubview(bigImageView)
        addSubview(textLabel)
        addSubview(smallImageView)

        // Устанавливаем constraints
        NSLayoutConstraint.activate([
            bigImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bigImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            bigImageView.widthAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.width),
            bigImageView.heightAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.height),

            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),

            smallImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            smallImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            smallImageView.widthAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.width),
            smallImageView.heightAnchor.constraint(equalToConstant: Q_ArticleImageStyles.Sizes.height)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
