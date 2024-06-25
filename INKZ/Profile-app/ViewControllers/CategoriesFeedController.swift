import UIKit

class SO_MainPage: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let textLabel = UILabel()
    private let subTextLabel = UILabel()
    private let openButton = UIButton()
    private let becomeMasterButton = UIButton()
    private let imageView = UIImageView()
    
    private let aboutTeamButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("о нашей команде", for: .normal)
        button.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(openAboutUsViewController), for: .touchUpInside)
        return button
    }()

    private let openFeedTwoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("открыть ленту", for: .normal)
        button.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 8
        return button
    }()
    
    let menu: OvalImageView = {
        let view = OvalImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private static let lightTextColor = UIColor.black
    private static let lightBackgroundColor = UIColor.white
    private static let lightButtonTextColor = UIColor.white
    private static let lightButtonBackgroundColor = UIColor.black
    
    private static let darkTextColor = UIColor.white
    private static let darkBackgroundColor = UIColor.black
    private static let darkButtonTextColor = UIColor.black
    private static let darkButtonBackgroundColor = UIColor.white
    
    private static let lightAboutButtonTextColor = UIColor.white
    private static let lightAboutButtonBackgroundColor = UIColor.black
    private static let darkAboutButtonTextColor = UIColor.black
    private static let darkAboutButtonBackgroundColor = UIColor.white

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        updateTheme(isDarkMode: isDarkMode)

        setupScrollView()
        setupContentView()
        setupTextLabel()
        setupSubTextLabel()
        setupOpenButton()
        setupBecomeMasterButton()
        setupImageView()
        setupTapGesture()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            updateTheme(isDarkMode: isDarkMode)
        }
    }
    
    private func updateTheme(isDarkMode: Bool) {
        let textColor = isDarkMode ? SO_MainPage.darkTextColor : SO_MainPage.lightTextColor
        let backgroundColor = isDarkMode ? SO_MainPage.darkBackgroundColor : SO_MainPage.lightBackgroundColor
        let buttonTextColor = isDarkMode ? SO_MainPage.darkButtonTextColor : SO_MainPage.lightButtonTextColor
        let buttonBackgroundColor = isDarkMode ? SO_MainPage.darkButtonBackgroundColor : SO_MainPage.lightButtonBackgroundColor

        textLabel.textColor = textColor
        subTextLabel.textColor = textColor
        contentView.backgroundColor = backgroundColor
        openButton.setTitleColor(buttonTextColor, for: .normal)
        openButton.backgroundColor = buttonBackgroundColor
        becomeMasterButton.setTitleColor(buttonTextColor, for: .normal)
        becomeMasterButton.backgroundColor = buttonBackgroundColor
        aboutTeamButton.setTitleColor(isDarkMode ? SO_MainPage.darkAboutButtonTextColor : SO_MainPage.lightAboutButtonTextColor, for: .normal)
        aboutTeamButton.backgroundColor = isDarkMode ? SO_MainPage.darkAboutButtonBackgroundColor : SO_MainPage.lightAboutButtonBackgroundColor
        openFeedTwoButton.setTitleColor(isDarkMode ? SO_MainPage.darkAboutButtonTextColor : SO_MainPage.lightAboutButtonTextColor, for: .normal)
        openFeedTwoButton.backgroundColor = isDarkMode ? SO_MainPage.darkAboutButtonBackgroundColor : SO_MainPage.lightAboutButtonBackgroundColor
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.backgroundColor = .white
    }

    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupTextLabel() {
        contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = """
        команда inkz
        поможет вам
        выбрать тату
        мастера
        """
        textLabel.font = UIFont(name: "SuisseIntl-Medium", size: 48)
        textLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupSubTextLabel() {
        contentView.addSubview(subTextLabel)
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subTextLabel.text = """
        мы отобрали лучших мастеров —
        ознакомьтесь с их работами
        и отзывами в профиле
        """
        subTextLabel.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        subTextLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            subTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 18),
            subTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    private func setupOpenButton() {
        contentView.addSubview(openButton)
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.setTitle("открыть ленту", for: .normal)
        openButton.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        openButton.layer.cornerRadius = 8

        NSLayoutConstraint.activate([
            openButton.topAnchor.constraint(equalTo: subTextLabel.bottomAnchor, constant: 18),
            openButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            openButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            openButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    private func setupBecomeMasterButton() {
        contentView.addSubview(becomeMasterButton)
        becomeMasterButton.translatesAutoresizingMaskIntoConstraints = false
        becomeMasterButton.setTitle("стать мастером", for: .normal)
        becomeMasterButton.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        becomeMasterButton.layer.cornerRadius = 8
        becomeMasterButton.layer.borderWidth = 2
        becomeMasterButton.layer.borderColor = UIColor.black.cgColor

        NSLayoutConstraint.activate([
            becomeMasterButton.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: 10),
            becomeMasterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            becomeMasterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            becomeMasterButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "W_AnimatedCard")
        imageView.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: becomeMasterButton.bottomAnchor, constant: 60),
            imageView.widthAnchor.constraint(equalToConstant: 353),
            imageView.heightAnchor.constraint(equalToConstant: 353),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        let anotherImageView = UIImageView()
        anotherImageView.translatesAutoresizingMaskIntoConstraints = false
        anotherImageView.image = UIImage(named: "Q_LandingPageImage")
        anotherImageView.contentMode = .scaleAspectFit
        contentView.addSubview(anotherImageView)

        NSLayoutConstraint.activate([
            anotherImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            anotherImageView.widthAnchor.constraint(equalToConstant: 353),
            anotherImageView.heightAnchor.constraint(equalToConstant: 231),
            anotherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        let additionalTextLabel = UILabel()
        additionalTextLabel.translatesAutoresizingMaskIntoConstraints = false
        additionalTextLabel.text = "кто такие inkz?"
        additionalTextLabel.font = UIFont(name: "SuisseIntl-Medium", size: 48)
        additionalTextLabel.numberOfLines = 0
        contentView.addSubview(additionalTextLabel)

        NSLayoutConstraint.activate([
            additionalTextLabel.topAnchor.constraint(equalTo: anotherImageView.bottomAnchor, constant: 18),
            additionalTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            additionalTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        let additionalSubTextLabel = UILabel()
        additionalSubTextLabel.translatesAutoresizingMaskIntoConstraints = false
        additionalSubTextLabel.text = """
        мы — медиа-сервис, который
        объединяет тату-мастеров и людей,
        которые хотят сделать татуировку
        или найти идеи для эскизов
        """
        additionalSubTextLabel.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        additionalSubTextLabel.numberOfLines = 0
        contentView.addSubview(additionalSubTextLabel)

        NSLayoutConstraint.activate([
            additionalSubTextLabel.topAnchor.constraint(equalTo: additionalTextLabel.bottomAnchor, constant: 18),
            additionalSubTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            additionalSubTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(aboutTeamButton)
        
        NSLayoutConstraint.activate([
            aboutTeamButton.topAnchor.constraint(equalTo: additionalSubTextLabel.bottomAnchor, constant: 18),
            aboutTeamButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutTeamButton.widthAnchor.constraint(equalToConstant: 353),
            aboutTeamButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        let bottomImageView = UIImageView()
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.image = UIImage(named: "W_TattooExamplesLandingPage")
        bottomImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(bottomImageView)

        NSLayoutConstraint.activate([
            bottomImageView.topAnchor.constraint(equalTo: aboutTeamButton.bottomAnchor, constant: 60),
            bottomImageView.widthAnchor.constraint(equalToConstant: 353),
            bottomImageView.heightAnchor.constraint(equalToConstant: 293),
            bottomImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        contentView.addSubview(openFeedTwoButton)

        NSLayoutConstraint.activate([
            openFeedTwoButton.topAnchor.constraint(equalTo: bottomImageView.bottomAnchor, constant: 18),
            openFeedTwoButton.widthAnchor.constraint(equalToConstant: 353),
            openFeedTwoButton.heightAnchor.constraint(equalToConstant: 52),
            openFeedTwoButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        let joinUsLabel = UILabel()
        joinUsLabel.translatesAutoresizingMaskIntoConstraints = false
        joinUsLabel.text = "присоединяйся к нашему сообществу"
        joinUsLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        joinUsLabel.textAlignment = .center
        joinUsLabel.numberOfLines = 0
        contentView.addSubview(joinUsLabel)

        NSLayoutConstraint.activate([
            joinUsLabel.topAnchor.constraint(equalTo: openFeedTwoButton.bottomAnchor, constant: 60),
            joinUsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            joinUsLabel.widthAnchor.constraint(equalToConstant: 310),
        ])

        let imageView1 = UIImageView()
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.image = UIImage(named: "dzen")
        imageView1.contentMode = .scaleAspectFit
        contentView.addSubview(imageView1)

        let imageView2 = UIImageView()
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView2.image = UIImage(named: "inst")
        imageView2.contentMode = .scaleAspectFit
        contentView.addSubview(imageView2)

        let imageView3 = UIImageView()
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView3.image = UIImage(named: "vc")
        imageView3.contentMode = .scaleAspectFit
        contentView.addSubview(imageView3)

        let imageView4 = UIImageView()
        imageView4.translatesAutoresizingMaskIntoConstraints = false
        imageView4.image = UIImage(named: "vk")
        imageView4.contentMode = .scaleAspectFit
        contentView.addSubview(imageView4)

        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: joinUsLabel.bottomAnchor, constant: 20),
            imageView1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -103),
            imageView1.widthAnchor.constraint(equalToConstant: 58),
            imageView1.heightAnchor.constraint(equalToConstant: 58),

            imageView2.topAnchor.constraint(equalTo: joinUsLabel.bottomAnchor, constant: 20),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 10),
            imageView2.widthAnchor.constraint(equalToConstant: 58),
            imageView2.heightAnchor.constraint(equalToConstant: 58),

            imageView3.topAnchor.constraint(equalTo: joinUsLabel.bottomAnchor, constant: 20),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: 10),
            imageView3.widthAnchor.constraint(equalToConstant: 58),
            imageView3.heightAnchor.constraint(equalToConstant: 58),

            imageView4.topAnchor.constraint(equalTo: joinUsLabel.bottomAnchor, constant: 20),
            imageView4.leadingAnchor.constraint(equalTo: imageView3.trailingAnchor, constant: 10),
            imageView4.widthAnchor.constraint(equalToConstant: 58),
            imageView4.heightAnchor.constraint(equalToConstant: 58),

            contentView.bottomAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 150)
        ])
        
        scrollView.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
    }

    @objc private func openAboutUsViewController() {
        let tattooFeedVC = SO_AboutUs()
        navigationController?.pushViewController(tattooFeedVC, animated: true)
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        scrollView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        view.endEditing(true)
    }
}

