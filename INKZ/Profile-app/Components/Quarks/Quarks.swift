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

struct Q_FavoritesImage {
    struct Sizes {
        static let width: CGFloat = 308.0
        static let height: CGFloat = 328.0
    }
}

struct Q_MasterCardAvatarImage {
    struct Sizes {
        static let width: CGFloat = 52.0
        static let height: CGFloat = 52.0
    }
    
    struct CornerRadius {
        static let value: CGFloat = 26.0 // половина размера, чтобы получить круглое изображение
    }
}

struct Q_TattooImage {
    struct Sizes {
        static let width: CGFloat = 308.0
        static let height: CGFloat = 382.0
    }
}

struct Q_MasterWorksImage {
    static let width: CGFloat = 221.0
    static let height: CGFloat = 170.0
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

class BasicPopularCategoriesCard: UIView {

    // MARK: - Properties
    
    let favoritesImage: UIImageView
    let cardsTitleLabel: UILabel

    // MARK: - Initialization
    
    init() {
        favoritesImage = UIImageView()
        cardsTitleLabel = UILabel()

        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI

    private func setupUI() {
        backgroundColor = UIColor.black
        layer.cornerRadius = 22.0
        clipsToBounds = true

        addSubview(favoritesImage)
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.0),
            favoritesImage.topAnchor.constraint(equalTo: topAnchor, constant: 22.0),
            favoritesImage.widthAnchor.constraint(equalToConstant: Q_FavoritesImage.Sizes.width),
            favoritesImage.heightAnchor.constraint(equalToConstant: Q_FavoritesImage.Sizes.height)
        ])
        favoritesImage.layer.cornerRadius = 10.0
        favoritesImage.layer.masksToBounds = true
        
        addSubview(cardsTitleLabel)
        cardsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsTitleLabel.topAnchor.constraint(equalTo: favoritesImage.bottomAnchor, constant: 20.0),
            cardsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.0),
            cardsTitleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: A_CardsTitleStyles.Restriction.textMaxWidth)
        ])

        cardsTitleLabel.font = A_CardsTitleStyles.Font.textFont
        cardsTitleLabel.textColor = A_CardsTitleStyles.Color.textColorWhite
        cardsTitleLabel.numberOfLines = 0
        cardsTitleLabel.text = A_CardsTitleStyles.Text.textInscription

        favoritesImage.image = UIImage(named: "")
        favoritesImage.contentMode = .scaleAspectFit
    }
}

class W_PopularCategoriesCardRealism: BasicPopularCategoriesCard {

    // MARK: - Overrides
    
    override init() {
        super.init()
        // Additional setup for your custom class
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Customization
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Реализм"
        favoritesImage.image = UIImage(named: "Q_FavoritesImageRealism")
    }
}

class W_PopularCategoriesCardIsrosumy: BasicPopularCategoriesCard {

    // MARK: - Overrides
    
    override init() {
        super.init()
        // Additional setup for your custom class
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Customization
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Ирозуми"
        favoritesImage.image = UIImage(named: "Q_FavoritesImageRealism")
    }
}

class W_PopularCategoriesCardOldSchool: BasicPopularCategoriesCard {

    // MARK: - Overrides
    
    override init() {
        super.init()
        // Additional setup for your custom class
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Customization
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Олдскул"
        favoritesImage.image = UIImage(named: "Q_FavoritesImageRealism")
    }
}


class BasicPopularTattooCard: UIView {

    // MARK: - Properties

    let favoritesImage: UIImageView
    let cardsTitleLabel: UILabel
    let bodyTextLabel: UILabel // New label for body text

    // MARK: - Initialization

    init() {
        favoritesImage = UIImageView()
        cardsTitleLabel = UILabel()
        bodyTextLabel = UILabel() // Initialize the new label

        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UI

    private func setupUI() {
        backgroundColor = UIColor.black
        layer.cornerRadius = 22.0
        clipsToBounds = true

        addSubview(favoritesImage)
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.0),
            favoritesImage.topAnchor.constraint(equalTo: topAnchor, constant: 22.0),
            favoritesImage.widthAnchor.constraint(equalToConstant: Q_TattooImage.Sizes.width),
            favoritesImage.heightAnchor.constraint(equalToConstant: Q_TattooImage.Sizes.height)
        ])

        // Add corner radius to favoritesImage
        favoritesImage.layer.cornerRadius = 10.0
        favoritesImage.layer.masksToBounds = true

        addSubview(cardsTitleLabel)
        cardsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardsTitleLabel.topAnchor.constraint(equalTo: favoritesImage.bottomAnchor, constant: 20.0),
            cardsTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.0),
            cardsTitleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: A_CardsTitleStyles.Restriction.textMaxWidth)
        ])

        addSubview(bodyTextLabel) // Add the new label to the view
        bodyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bodyTextLabel.topAnchor.constraint(equalTo: cardsTitleLabel.bottomAnchor, constant: 10.0), // Add 20.0 points spacing
            bodyTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.0),
            bodyTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: A_CardsTitleStyles.Restriction.textMaxWidth)
        ])

        cardsTitleLabel.font = A_CardsTitleStyles.Font.textFont
        cardsTitleLabel.textColor = A_CardsTitleStyles.Color.textColorWhite
        cardsTitleLabel.numberOfLines = 0
        cardsTitleLabel.text = A_CardsTitleStyles.Text.textInscription

        bodyTextLabel.font = A_BodyTextCardsStyles.Font.textFont // Set font for the new label
        bodyTextLabel.textColor = A_BodyTextCardsStyles.Color.textColorWhite // Set text color for the new label
        bodyTextLabel.numberOfLines = 0 // Allow multiple lines for the new label
        // Set any default or common text for the new label here if needed

        favoritesImage.image = UIImage(named: "")
        favoritesImage.contentMode = .scaleAspectFit
    }
}

class W_PopularTattooCard: BasicPopularTattooCard {
    
    override init() {
        super.init()
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Череп с глазками"
        bodyTextLabel.text = "lunarwhisper"
        favoritesImage.image = UIImage(named: "Q_TattooCardImage2")
    }
}

class W_PopularTattooCard2: BasicPopularTattooCard {
    
    override init() {
        super.init()
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Мумий Тролль"
        bodyTextLabel.text = "azureflame"
        favoritesImage.image = UIImage(named: "Q_TattooCardImage1")
    }
}

class W_PopularTattooCard3: BasicPopularTattooCard {
    
    override init() {
        super.init()
        customizeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeUI() {
        // Customize properties specific to your subclass
        cardsTitleLabel.text = "Танец"
        bodyTextLabel.text = "silentspectre"
        favoritesImage.image = UIImage(named: "Q_TattooCardImage")
    }
}

class C_MasterCard: UIView {

    private let imageName = "Q_MasterSearchImage"
    private let avatarImageName = "Q_TattooMasterImage" // Имя изображения из assets
    private let leftMargin: CGFloat = 20.0
    private let topMargin: CGFloat = 20.0

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 281)
        view.layer.cornerRadius = 20.0
        return view
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: leftMargin, y: topMargin, width: 221.0, height: 170.0)
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: avatarImageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: leftMargin, y: topMargin + 170 + 15, width: Q_MasterCardAvatarImage.Sizes.width, height: Q_MasterCardAvatarImage.Sizes.height)
        imageView.layer.cornerRadius = Q_MasterCardAvatarImage.CornerRadius.value
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var masterCardDataView: W_MasterCardReviews = {
        let view = W_MasterCardReviews()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let masterCardDataView2: W_MasterCardRating = {
        let view = W_MasterCardRating()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let masterCardDataView3: W_MasterCardWorks = {
        let view = W_MasterCardWorks()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Александр Иванов"
        label.font = A_CardsBodyTextStyles.Font.textFont
        label.textColor = A_CardsBodyTextStyles.Color.textColorWhite
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(greenView)
        greenView.addSubview(imageView)
        greenView.addSubview(masterCardDataView)
        greenView.addSubview(masterCardDataView2)
        greenView.addSubview(masterCardDataView3)
        greenView.addSubview(avatarImageView)
        greenView.addSubview(bodyLabel)

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            masterCardDataView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            masterCardDataView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 18),
            masterCardDataView2.topAnchor.constraint(equalTo: masterCardDataView.bottomAnchor, constant: 63),
            masterCardDataView2.leadingAnchor.constraint(equalTo: masterCardDataView.leadingAnchor),
            masterCardDataView3.topAnchor.constraint(equalTo: masterCardDataView2.bottomAnchor, constant: 63),
            masterCardDataView3.leadingAnchor.constraint(equalTo: masterCardDataView2.leadingAnchor),

            // Constraints for avatarImageView
            avatarImageView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 20),

            // Constraints for bodyLabel
            bodyLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 65),
            bodyLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }
}

class C_TemporaryMasterCard: UIView {

    private let imageName = "Q_MasterSearchImage1"
    private let avatarImageName = "Q_TattooMasterImage1" // Имя изображения из assets
    private let leftMargin: CGFloat = 20.0
    private let topMargin: CGFloat = 20.0

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.frame = CGRect(x: 0, y: 0, width: 350, height: 281)
        view.layer.cornerRadius = 20.0
        return view
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: leftMargin, y: topMargin, width: 221.0, height: 170.0)
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var avatarImageView: UIImageView = {
        let image = UIImage(named: avatarImageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: leftMargin, y: topMargin + 170 + 15, width: Q_MasterCardAvatarImage.Sizes.width, height: Q_MasterCardAvatarImage.Sizes.height)
        imageView.layer.cornerRadius = Q_MasterCardAvatarImage.CornerRadius.value
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var masterCardDataView: W_MasterCardReviews1 = {
        let view = W_MasterCardReviews1()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let masterCardDataView2: W_MasterCardRating1 = {
        let view = W_MasterCardRating1()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let masterCardDataView3: W_MasterCardWorks1 = {
        let view = W_MasterCardWorks1()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Дмитрий Петров"
        label.font = A_CardsBodyTextStyles.Font.textFont
        label.textColor = A_CardsBodyTextStyles.Color.textColorWhite
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(greenView)
        greenView.addSubview(imageView)
        greenView.addSubview(masterCardDataView)
        greenView.addSubview(masterCardDataView2)
        greenView.addSubview(masterCardDataView3)
        greenView.addSubview(avatarImageView)
        greenView.addSubview(bodyLabel)

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            masterCardDataView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            masterCardDataView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 18),
            masterCardDataView2.topAnchor.constraint(equalTo: masterCardDataView.bottomAnchor, constant: 63),
            masterCardDataView2.leadingAnchor.constraint(equalTo: masterCardDataView.leadingAnchor),
            masterCardDataView3.topAnchor.constraint(equalTo: masterCardDataView2.bottomAnchor, constant: 63),
            masterCardDataView3.leadingAnchor.constraint(equalTo: masterCardDataView2.leadingAnchor),

            // Constraints for avatarImageView
            avatarImageView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 20),

            // Constraints for bodyLabel
            bodyLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 65),
            bodyLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }
}
