//
//  AboutUsViewController.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 29/10/2023.
//
import UIKit

class AboutUsViewController: UIViewController, UIScrollViewDelegate {
    
    var menuView: UIView!
    var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let scrollViewAboutUs = UIScrollView()
        scrollViewAboutUs.frame = view.bounds
        scrollViewAboutUs.contentSize = CGSize(width: view.frame.width, height: 3670)
        scrollViewAboutUs.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(scrollViewAboutUs)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.466, green: 0.510, blue: 0.843, alpha: 1.0).cgColor,
            UIColor(red: 0.835, green: 0.792, blue: 0.890, alpha: 1.0).cgColor,
            UIColor.white.cgColor,
        ]
        gradientLayer.locations = [0.1, 0.25, 0.5]
        view.layer.insertSublayer(gradientLayer, at: 0)
        view.backgroundColor = .clear
        
        let imageViewINKZ = UIImageView()
        imageViewINKZ.image = UIImage(named: "imageViewINKZ")
        imageViewINKZ.frame = CGRect(x: (view.frame.width - 281) / 2, y: 25, width: 281, height: 179)
        
        scrollViewAboutUs.addSubview(imageViewINKZ)
        
        let labelMediaService = UILabel()
        labelMediaService.text = "Медиа-сервис, который объединяет тату-мастеров и клиентов".uppercased()
        labelMediaService.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelMediaService.textColor = .black
        labelMediaService.textAlignment = .left
        labelMediaService.numberOfLines = 0
        labelMediaService.lineBreakMode = .byWordWrapping
        labelMediaService.translatesAutoresizingMaskIntoConstraints = false
        labelMediaService.contentHuggingPriority(for: .horizontal)
        labelMediaService.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelMediaService.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelMediaService.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelMediaService)
        
        NSLayoutConstraint.activate([
            labelMediaService.topAnchor.constraint(equalTo: imageViewINKZ.bottomAnchor, constant: 10),
            labelMediaService.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelMediaService.widthAnchor.constraint(lessThanOrEqualToConstant: 350),
        ])
        
        let labelWeConnect = UILabel()
        labelWeConnect.text = "Мы собираем вместе мастеров из разных городов России и делаем процесс вашего знакомства с ними прозрачным"
        labelWeConnect.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        labelWeConnect.textColor = .black
        labelWeConnect.textAlignment = .left
        labelWeConnect.numberOfLines = 0
        labelWeConnect.lineBreakMode = .byWordWrapping
        labelWeConnect.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewAboutUs.addSubview(labelWeConnect)
        
        NSLayoutConstraint.activate([
            labelWeConnect.topAnchor.constraint(equalTo: labelMediaService.bottomAnchor, constant: 15),
            labelWeConnect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            labelWeConnect.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
        ])
        
        
        let labelAboutWhat = UILabel()
        labelAboutWhat.text = "Про что мы?".uppercased()
        labelAboutWhat.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelAboutWhat.textColor = .black
        labelAboutWhat.textAlignment = .left
        labelAboutWhat.numberOfLines = 0
        labelAboutWhat.lineBreakMode = .byWordWrapping
        labelAboutWhat.translatesAutoresizingMaskIntoConstraints = false
        labelAboutWhat.contentHuggingPriority(for: .horizontal)
        labelAboutWhat.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelAboutWhat.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelAboutWhat.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelAboutWhat)
        
        NSLayoutConstraint.activate([
            labelAboutWhat.topAnchor.constraint(equalTo: labelWeConnect.bottomAnchor, constant: 70),
            labelAboutWhat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelAboutWhat.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
        ])
        
        let circleView = UIView()
        circleView.backgroundColor = .black
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.cornerRadius = 7
        circleView.layer.masksToBounds = true
        
        
        scrollViewAboutUs.addSubview(circleView)
        
        let labelCommunity = UILabel()
        labelCommunity.text = "Сообщество".uppercased()
        labelCommunity.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelCommunity.textColor = .black
        labelCommunity.textAlignment = .left
        labelCommunity.numberOfLines = 0
        labelCommunity.lineBreakMode = .byWordWrapping
        labelCommunity.translatesAutoresizingMaskIntoConstraints = false
        labelCommunity.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelCommunity.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelCommunity.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelCommunity.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelCommunity)
        
        NSLayoutConstraint.activate([
            labelCommunity.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 10),
            labelCommunity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            circleView.topAnchor.constraint(equalTo: labelAboutWhat.bottomAnchor, constant: 40),
            circleView.widthAnchor.constraint(equalToConstant: 14),
            circleView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        let imageAboutUSTrible = UIImageView()
        imageAboutUSTrible.image = UIImage(named: "imageAboutUSTrible")
        
        imageAboutUSTrible.translatesAutoresizingMaskIntoConstraints = false
        scrollViewAboutUs.addSubview(imageAboutUSTrible)
        
        NSLayoutConstraint.activate([
            imageAboutUSTrible.widthAnchor.constraint(equalToConstant: 171),
            imageAboutUSTrible.heightAnchor.constraint(equalToConstant: 289),
            imageAboutUSTrible.bottomAnchor.constraint(equalTo: labelCommunity.bottomAnchor, constant: 45),
            imageAboutUSTrible.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        
        let labelTalk = UILabel()
        labelTalk.text = "Общайтесь друг с другом, обменивайтесь навыками и становитесь лучше вместе!"
        labelTalk.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        labelTalk.textColor = .black
        labelTalk.textAlignment = .left
        labelTalk.numberOfLines = 0
        labelTalk.lineBreakMode = .byWordWrapping
        labelTalk.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewAboutUs.addSubview(labelTalk)
        
        NSLayoutConstraint.activate([
            labelTalk.topAnchor.constraint(equalTo: labelCommunity.bottomAnchor, constant: 15),
            labelTalk.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            labelTalk.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
        
        let circleViewSafety = UIView()
        circleViewSafety.backgroundColor = .black
        circleViewSafety.translatesAutoresizingMaskIntoConstraints = false
        circleViewSafety.layer.cornerRadius = 7
        circleViewSafety.layer.masksToBounds = true
        
        scrollViewAboutUs.addSubview(circleViewSafety)
        
        let labelSafety = UILabel()
        labelSafety.text = "Безопасность".uppercased()
        labelSafety.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelSafety.textColor = .black
        labelSafety.textAlignment = .left
        labelSafety.numberOfLines = 0
        labelSafety.lineBreakMode = .byWordWrapping
        labelSafety.translatesAutoresizingMaskIntoConstraints = false
        labelSafety.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelSafety.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelSafety.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelSafety.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelSafety)
        
        NSLayoutConstraint.activate([
            labelSafety.topAnchor.constraint(equalTo: circleViewSafety.bottomAnchor, constant: 10),
            labelSafety.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
            circleViewSafety.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            circleViewSafety.topAnchor.constraint(equalTo: labelTalk.bottomAnchor, constant: 40),
            circleViewSafety.widthAnchor.constraint(equalToConstant: 14),
            circleViewSafety.heightAnchor.constraint(equalToConstant: 14)
        ])
 
        let labelTransparent = UILabel()
        labelTransparent.text = "Прозрачная платформа с возможностью просмотра отзывов о мастерах"
        labelTransparent.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        labelTransparent.numberOfLines = 0
        labelTransparent.lineBreakMode = .byWordWrapping
        labelTransparent.translatesAutoresizingMaskIntoConstraints = false

        scrollViewAboutUs.addSubview(labelTransparent)

        NSLayoutConstraint.activate([
            labelTransparent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            labelTransparent.topAnchor.constraint(equalTo: labelSafety.bottomAnchor, constant: 10),
            labelTransparent.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])



        let imageView = UIImageView(image: UIImage(named: "functionsImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewAboutUs.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: labelTransparent.bottomAnchor, constant: 35),
            imageView.widthAnchor.constraint(equalToConstant: 350),
            imageView.heightAnchor.constraint(equalToConstant: 720)
        ])

        let circleViewIndividuality = UIView()
        circleViewIndividuality.backgroundColor = .black
        circleViewIndividuality.translatesAutoresizingMaskIntoConstraints = false
        circleViewIndividuality.layer.cornerRadius = 7
        circleViewIndividuality.layer.masksToBounds = true
        
        scrollViewAboutUs.addSubview(circleViewIndividuality)
        
        
        let labelIndividuality = UILabel()
        labelIndividuality.text = "Индивидуальность".uppercased()
        labelIndividuality.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelIndividuality.textColor = .black
        labelIndividuality.textAlignment = .left
        labelIndividuality.numberOfLines = 0
        labelIndividuality.lineBreakMode = .byWordWrapping
        labelIndividuality.translatesAutoresizingMaskIntoConstraints = false
        labelIndividuality.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelIndividuality.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelIndividuality.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelIndividuality.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelIndividuality)
        
        NSLayoutConstraint.activate([
            labelIndividuality.topAnchor.constraint(equalTo: circleViewIndividuality.bottomAnchor, constant: 10),
            labelIndividuality.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            circleViewIndividuality.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            circleViewIndividuality.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            circleViewIndividuality.widthAnchor.constraint(equalToConstant: 14),
            circleViewIndividuality.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        let labelWeCreate = UILabel()
        labelWeCreate.text = "Мы создаем среду талантливых личностей и следим за безопасностью ваших работ"
        labelWeCreate.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        labelWeCreate.numberOfLines = 0
        labelWeCreate.lineBreakMode = .byWordWrapping
        labelWeCreate.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewAboutUs.addSubview(labelWeCreate)
        
        NSLayoutConstraint.activate([
            labelWeCreate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelWeCreate.topAnchor.constraint(equalTo: labelIndividuality.bottomAnchor, constant: 15),
            labelWeCreate.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ])
        
        let labelOurOpportunities = UILabel()
        labelOurOpportunities.text = "Наши возможности".uppercased()
        labelOurOpportunities.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelOurOpportunities.textColor = .black
        labelOurOpportunities.textAlignment = .left
        labelOurOpportunities.numberOfLines = 0
        labelOurOpportunities.lineBreakMode = .byWordWrapping
        labelOurOpportunities.translatesAutoresizingMaskIntoConstraints = false
        labelOurOpportunities.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelOurOpportunities.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelOurOpportunities.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelOurOpportunities.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelOurOpportunities)
        
        NSLayoutConstraint.activate([
            labelOurOpportunities.topAnchor.constraint(equalTo: labelWeCreate.bottomAnchor, constant: 65),
            labelOurOpportunities.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        

        let scrollViewCards = UIScrollView()
        scrollViewCards.translatesAutoresizingMaskIntoConstraints = false
        scrollViewCards.isPagingEnabled = true
        scrollViewCards.showsHorizontalScrollIndicator = false
        scrollViewAboutUs.addSubview(scrollViewCards)

        NSLayoutConstraint.activate([
            scrollViewCards.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewCards.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewCards.topAnchor.constraint(equalTo: labelOurOpportunities.bottomAnchor, constant: 10),
            scrollViewCards.heightAnchor.constraint(equalToConstant: 460)
        ])
        var previousCardViewScroll: UIView?
        
        let iconNames = ["iconScrollCard1", "iconScrollCard2.png", "iconScrollCard3.png"]
        var iconIndex = 0

        let labelTexts = ["Все работы привязаны к аккаунтам авторов, через которые можно связаться с мастерами и узнать о них еще больше", "Вы сможете просматривать работы мастеров, которые будут отображаться в ленте и периодически обновляться", "К ленте можно применить различные фильтры, чтобы ускорить процесс выбора мастера или эскиза"]
        var labelTextIndex = 0
        let headerTexts = ["Лента с работами", "Аккаунты мастеров", "Фильтры по стилям"]
        var headerTextIndex = 0

        for _ in 1...3 {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "1")
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 32

            scrollViewCards.addSubview(imageView)

            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalTo: scrollViewCards.widthAnchor, constant: -25),
                imageView.heightAnchor.constraint(equalToConstant: 390),
            ])

            if let previousCardView = previousCardViewScroll {
                imageView.leadingAnchor.constraint(equalTo: previousCardView.trailingAnchor, constant: -10).isActive = true
            } else {
                imageView.centerXAnchor.constraint(equalTo: scrollViewCards.centerXAnchor).isActive = true
            }

            imageView.topAnchor.constraint(equalTo: scrollViewCards.topAnchor, constant: 20).isActive = true

            let iconImageView = UIImageView()
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            iconImageView.image = UIImage(named: iconNames[iconIndex])
            iconIndex = (iconIndex + 1) % iconNames.count
            iconImageView.contentMode = .scaleAspectFit

            imageView.addSubview(iconImageView)

            NSLayoutConstraint.activate([
                iconImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -30),
                iconImageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 30),
                iconImageView.widthAnchor.constraint(equalToConstant: 142),
                iconImageView.heightAnchor.constraint(equalToConstant: 129),
            ])

            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = labelTexts[labelTextIndex]
            labelTextIndex = (labelTextIndex + 1) % labelTexts.count
            label.font = UIFont(name: "SuisseIntl-Regular", size: 16)
            label.textColor = UIColor.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping

            imageView.addSubview(label)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
                label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -35),
                label.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
            ])

            
            let headerLabel = UILabel()
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            headerLabel.text = headerTexts[headerTextIndex].uppercased()
            headerTextIndex = (headerTextIndex + 1) % headerTexts.count
            headerLabel.font = UIFont(name: "SuisseIntl-Bold", size: 20)
            headerLabel.textColor = UIColor.black
            headerLabel.numberOfLines = 0
            headerLabel.lineBreakMode = .byWordWrapping

            imageView.addSubview(headerLabel)

            NSLayoutConstraint.activate([
                headerLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
                headerLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
                headerLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
            ])


            previousCardViewScroll = imageView
        }
        
        scrollViewCards.contentSize = CGSize(width: (view.frame.width - 33) * 3 + 15 * 2, height: 400)

        let labelOurCommunity = UILabel()
        labelOurCommunity.text = "Наше сообщество".uppercased()
        labelOurCommunity.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelOurCommunity.textColor = .black
        labelOurCommunity.textAlignment = .left
        labelOurCommunity.numberOfLines = 0
        labelOurCommunity.lineBreakMode = .byWordWrapping
        labelOurCommunity.translatesAutoresizingMaskIntoConstraints = false
        labelOurCommunity.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelOurCommunity.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelOurCommunity.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelOurCommunity.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelOurCommunity)
        
        NSLayoutConstraint.activate([
            labelOurCommunity.topAnchor.constraint(equalTo: scrollViewCards.bottomAnchor, constant: 10),
            labelOurCommunity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelOurCommunity.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
        ])
        
        let labelWeConnectTogether = UILabel()
        labelWeConnectTogether.text = "Мы собираем вместе мастеров из разных городов России и делаем процесс вашего знакомства с ними прозрачным"
        labelWeConnectTogether.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        labelWeConnectTogether.textColor = .black
        labelWeConnectTogether.textAlignment = .left
        labelWeConnectTogether.numberOfLines = 0
        labelWeConnectTogether.lineBreakMode = .byWordWrapping
        labelWeConnectTogether.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewAboutUs.addSubview(labelWeConnectTogether)
        
        NSLayoutConstraint.activate([
            labelWeConnectTogether.topAnchor.constraint(equalTo: labelOurCommunity.bottomAnchor, constant: 15),
            labelWeConnectTogether.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            labelWeConnectTogether.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
        ])
        
        var newUsersImageAboutViews = [UIImageView]()
        let profileAboutNames = ["@hardblank__", "@lika.saburenko", "@d.marinchenkov", "@13_bodytattoos", "@hanzai_boy", "@gorehex"]
        var lastImageAboutView: UIImageView?
        var lastAboutLabel: UILabel?
        var secondToLastAboutLabel: UILabel?

        let profileAboutImages = [UIImage(named: "avatar1"), UIImage(named: "avatar2"), UIImage(named: "avatar3"), UIImage(named: "avatar4"), UIImage(named: "avatar5"), UIImage(named: "avatar6")]
        
        for i in 0..<6 {
            let newUserImageAboutView = UIImageView()
            newUserImageAboutView.translatesAutoresizingMaskIntoConstraints = false
            newUserImageAboutView.layer.cornerRadius = 82.5
            newUserImageAboutView.clipsToBounds = true
            newUserImageAboutView.contentMode = .scaleAspectFill
            newUserImageAboutView.image = profileAboutImages[i]
            scrollViewAboutUs.addSubview(newUserImageAboutView)
            newUsersImageAboutViews.append(newUserImageAboutView)
            newUserImageAboutView.widthAnchor.constraint(equalToConstant: 165).isActive = true
            newUserImageAboutView.heightAnchor.constraint(equalToConstant: 165).isActive = true
            
            if i % 2 == 0 {
                newUserImageAboutView.leadingAnchor.constraint(equalTo: scrollViewAboutUs.leadingAnchor, constant: 20).isActive = true
            } else {
                newUserImageAboutView.leadingAnchor.constraint(equalTo: lastImageAboutView!.trailingAnchor, constant: 20).isActive = true
            }
            
            if i < 2 {
                newUserImageAboutView.topAnchor.constraint(equalTo: labelWeConnectTogether.bottomAnchor, constant: 35).isActive = true
            } else {
                newUserImageAboutView.topAnchor.constraint(equalTo: secondToLastAboutLabel!.bottomAnchor, constant: 20).isActive = true
            }
  
            let nameAboutLabel = UILabel()
            nameAboutLabel.translatesAutoresizingMaskIntoConstraints = false
            nameAboutLabel.text = profileAboutNames[i]
            nameAboutLabel.textColor = UIColor.gray
            nameAboutLabel.font = UIFont(name: "SuisseIntl-Regular", size: 17)
            scrollViewAboutUs.addSubview(nameAboutLabel)
            
            nameAboutLabel.leadingAnchor.constraint(equalTo: newUserImageAboutView.leadingAnchor, constant: 5).isActive = true
            nameAboutLabel.topAnchor.constraint(equalTo: newUserImageAboutView.bottomAnchor, constant: 10).isActive = true
            secondToLastAboutLabel = lastAboutLabel
            lastImageAboutView = newUserImageAboutView
            lastAboutLabel = nameAboutLabel
        }
        
        
        let labelOurTeam = UILabel()
        labelOurTeam.text = "Наша команда".uppercased()
        labelOurTeam.font = UIFont(name: "SuisseIntl-Bold", size: 20)
        labelOurTeam.textColor = .black
        labelOurTeam.textAlignment = .left
        labelOurTeam.numberOfLines = 0
        labelOurTeam.lineBreakMode = .byWordWrapping
        labelOurTeam.translatesAutoresizingMaskIntoConstraints = false
        labelOurTeam.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        labelOurTeam.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        labelOurTeam.setContentHuggingPriority(UILayoutPriority.required, for: .vertical)
        labelOurTeam.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        scrollViewAboutUs.addSubview(labelOurTeam)
        
        NSLayoutConstraint.activate([
            labelOurTeam.topAnchor.constraint(equalTo: labelOurCommunity.bottomAnchor, constant: 805),
            labelOurTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelOurTeam.widthAnchor.constraint(lessThanOrEqualToConstant: 300),
        ])
        
        let teamNames = ["Стася Шестакова", "Ася Олейниченко", "Максим Божик"]
        
        var previousImageView: UIImageView?
        
        for i in 0..<3 {
            let imageTeamView = UIImageView()
            imageTeamView.image = UIImage(named: "imageTeamView\(i + 1)")
            imageTeamView.translatesAutoresizingMaskIntoConstraints = false
            scrollViewAboutUs.addSubview(imageTeamView)
            
            let imageWidth = 165
            let imageHeight = 165
            
            imageTeamView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth)).isActive = true
            imageTeamView.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight)).isActive = true
            
            let nameTeamMember = UILabel()
            nameTeamMember.translatesAutoresizingMaskIntoConstraints = false
            nameTeamMember.text = teamNames[i]
            nameTeamMember.textColor = UIColor.gray
            nameTeamMember.font = UIFont(name: "SuisseIntl-Regular", size: 17)
            scrollViewAboutUs.addSubview(nameTeamMember)
            
            NSLayoutConstraint.activate([
                imageTeamView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth)),
                imageTeamView.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight)),
            ])
            
            if i == 0 {
                imageTeamView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            } else if i == 1 {
                imageTeamView.leadingAnchor.constraint(equalTo: previousImageView!.trailingAnchor, constant: 20).isActive = true
            }

            if i == 2 {
                imageTeamView.centerXAnchor.constraint(equalTo: scrollViewAboutUs.centerXAnchor).isActive = true
                imageTeamView.topAnchor.constraint(equalTo: previousImageView!.bottomAnchor, constant: 50).isActive = true
            } else {
                imageTeamView.topAnchor.constraint(equalTo: labelOurTeam.bottomAnchor, constant: 30).isActive = true
            }
            
            nameTeamMember.leadingAnchor.constraint(equalTo: imageTeamView.leadingAnchor, constant: 5).isActive = true
            nameTeamMember.topAnchor.constraint(equalTo: imageTeamView.bottomAnchor, constant: 10).isActive = true
            
            previousImageView = imageTeamView
            

            let menuView = UIView()
            menuView.frame = CGRect(x: (view.frame.width - 255) / 2, y: 745, width: 255, height: 62)
            menuView.backgroundColor = UIColor.clear

            let menuMaskLayer = CAShapeLayer()
            menuMaskLayer.path = UIBezierPath(roundedRect: menuView.bounds, cornerRadius: menuView.frame.height / 2).cgPath
            menuView.layer.mask = menuMaskLayer

            let menuGradientLayer = CAGradientLayer()
            menuGradientLayer.frame = menuView.bounds
            menuGradientLayer.opacity = 0.4

            let startMenuColor = UIColor(hex: 0xFFFFFF).cgColor
            let endMenuColor = UIColor(hex: 0xF0EFEF).cgColor
            menuGradientLayer.colors = [startMenuColor, endMenuColor]

            menuGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            menuGradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

            menuView.layer.insertSublayer(menuGradientLayer, at: 0)

            let menuBlurEffect = UIBlurEffect(style: .light)
            let menuBlurView = UIVisualEffectView(effect: menuBlurEffect)
            menuBlurView.frame = menuView.bounds
            menuBlurView.alpha = 0.9

            menuView.addSubview(menuBlurView)

            let menuBorderLayer = CAShapeLayer()
            menuBorderLayer.path = menuMaskLayer.path
            menuBorderLayer.strokeColor = UIColor.white.cgColor
            menuBorderLayer.fillColor = UIColor.clear.cgColor
            menuBorderLayer.lineWidth = 2.0
            menuView.layer.addSublayer(menuBorderLayer)

            let iconSizeMenu = CGSize(width: 35, height: 35)
            let iconSpacingMenu: CGFloat = 15
            let iconCountMenu = 4

            let iconNamesMenu: [String] = ["iconMenu1", "iconMenu2", "iconMenu3", "iconMenu4"]

            let totalWidthMenuIcons = CGFloat(iconCountMenu) * (iconSizeMenu.width + iconSpacingMenu) - iconSpacingMenu

            let startXMenuIcon = (menuView.bounds.width - totalWidthMenuIcons) / 2

            for (indexMenu, iconNameMenu) in iconNamesMenu.enumerated() {
                if let iconImageMenu = UIImage(named: iconNameMenu) {
                    let iconButton = UIButton(type: .custom)
                    iconButton.frame = CGRect(x: startXMenuIcon + CGFloat(indexMenu) * (iconSizeMenu.width + iconSpacingMenu), y: 13, width: iconSizeMenu.width, height: iconSizeMenu.height)
                    iconButton.setImage(iconImageMenu, for: .normal)
                    if indexMenu == 0 {
                        iconButton.addTarget(self, action: #selector(openMainViewController), for: .touchUpInside)
                    }
                    if indexMenu == 3 {
                        iconButton.addTarget(self, action: #selector(openViewController), for: .touchUpInside)
                    }

                    menuView.addSubview(iconButton)
                }
            }

            view.addSubview(menuView)
            
        }
        
        
    }
    
    @objc func openMainViewController() {
        if let navigationController = navigationController, navigationController.topViewController is MainViewController {
            return
        }

        let mainViewController = MainViewController()
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window?.layer.add(transition, forKey: kCATransition)
        navigationController?.pushViewController(mainViewController, animated: false)
    }
    
    
    @objc func openViewController() {
        if let navigationController = navigationController, navigationController.topViewController is ViewController {
            return
        }

        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)

    }



    


}









