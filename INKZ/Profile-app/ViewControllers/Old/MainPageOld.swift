//
//  MainViewController.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 27/10/2023.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class MainViewController: UIViewController, UITextFieldDelegate {
    
    var menuView: UIView!
    let searchField = UITextField()
    var tapGesture: UITapGestureRecognizer?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        let scrollViewMain = UIScrollView()
        scrollViewMain.frame = view.bounds
        scrollViewMain.contentSize = CGSize(width: view.frame.width, height: 2460)
        view.addSubview(scrollViewMain)
        view.backgroundColor = UIColor(hex: 0xF3F3F3)
        
        
        searchField.frame = CGRect(x: 20, y: 80, width: 282, height: 53)
        searchField.placeholder = "Поиск"
        
        
        let iconImage = UIImage(named: "")
        let iconImageView = UIImageView(image: iconImage)
        let iconWidth: CGFloat = 20
        let iconSpacing: CGFloat = 10
        let leftIconOffset: CGFloat = 20
        
        
        let leftViewContainer = UIView(frame: CGRect(x: 0, y: 0, width: iconWidth + iconSpacing + leftIconOffset, height: searchField.frame.size.height))
        
        iconImageView.frame = CGRect(x: leftIconOffset, y: (leftViewContainer.frame.size.height - iconWidth) / 2, width: iconWidth, height: iconWidth)
        leftViewContainer.addSubview(iconImageView)
        
        let spaceView = UIView(frame: CGRect(x: iconWidth + leftIconOffset, y: 0, width: iconSpacing, height: searchField.frame.size.height))
        leftViewContainer.addSubview(spaceView)

        searchField.leftView = leftViewContainer
        searchField.leftViewMode = .always

        let ovalMaskLayer = CAShapeLayer()
        ovalMaskLayer.path = UIBezierPath(roundedRect: searchField.bounds, cornerRadius: searchField.frame.height / 2).cgPath
        searchField.layer.mask = ovalMaskLayer

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = searchField.bounds
        gradientLayer.opacity = 0.4

        let startColor = UIColor(hex: 0xFFFFFF).cgColor
        let endColor = UIColor(hex: 0xF0EFEF).cgColor
        gradientLayer.colors = [startColor, endColor]

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        searchField.layer.insertSublayer(gradientLayer, at: 0)

        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = searchField.bounds
        blurView.alpha = 0.9

        searchField.addSubview(blurView)

        let borderLayer = CAShapeLayer()
        borderLayer.path = ovalMaskLayer.path
        borderLayer.strokeColor = UIColor.white.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = 2.0
        searchField.layer.addSublayer(borderLayer)

        view.addSubview(searchField)

        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture!)

         
        
        let bellImageView = UIImageView(image: UIImage(named: "bellImage"))
        let bellImageSize: CGFloat = 53
        let bellImageMargin: CGFloat = 20
        let bellImageX = UIScreen.main.bounds.width - bellImageSize - bellImageMargin
        bellImageView.frame = CGRect(x: bellImageX, y: searchField.frame.origin.y, width: bellImageSize, height: bellImageSize)
        self.view.addSubview(bellImageView)
        
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width + 400, height: view.frame.height)
        scrollView.showsHorizontalScrollIndicator = false
        scrollViewMain.addSubview(scrollView)

        let filterImageView = UIImageView(image: UIImage(named: "filterIcon"))
        let filterImageSize: CGFloat = 44
        let filterImageX: CGFloat = 20
        let filterImageY: CGFloat = 95
        filterImageView.frame = CGRect(x: filterImageX, y: filterImageY, width: filterImageSize, height: filterImageSize)

        scrollViewMain.addSubview(filterImageView)

        let ovalContainerSpacing: CGFloat = 10
        let numberOfOvalContainers = 5
        var xPosition = filterImageView.frame.maxX + 25
        let labels = ["трайблы", "реализм", "аниме", "контурные", "олдскул"]

        for i in 0..<numberOfOvalContainers {
            let ovalContainer = UIView()
            
            let label = UILabel()
            label.text = labels[i]
            label.font = UIFont(name: "SuisseIntl-Medium", size: 16)
            label.sizeToFit()
            
            let ovalContainerWidth = label.frame.width + 60
            let ovalContainerHeight: CGFloat = 44
            
            ovalContainer.frame = CGRect(x: xPosition, y: filterImageY, width: ovalContainerWidth, height: ovalContainerHeight)
            ovalContainer.layer.cornerRadius = ovalContainerHeight / 2
            ovalContainer.clipsToBounds = true
            
            let borderContainer = UIView()
            borderContainer.frame = ovalContainer.bounds
            
            let borderLayer = CAShapeLayer()
            borderLayer.path = UIBezierPath(roundedRect: borderContainer.bounds, cornerRadius: ovalContainerHeight / 2).cgPath
            borderLayer.strokeColor = UIColor.white.cgColor
            borderLayer.fillColor = UIColor.clear.cgColor
            borderLayer.lineWidth = 2.0
            borderContainer.layer.addSublayer(borderLayer)
            
            ovalContainer.addSubview(borderContainer)
            
            let gradientContainer = UIView()
            gradientContainer.frame = ovalContainer.bounds
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = gradientContainer.bounds
            gradientLayer.opacity = 0.3
            
            let startColor = UIColor(hex: 0xFFFFFF).cgColor
            let endColor = UIColor(hex: 0xF0EFEF).cgColor
            gradientLayer.colors = [startColor, endColor]
            
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            
            gradientContainer.layer.addSublayer(gradientLayer)
            ovalContainer.addSubview(gradientContainer)
            
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = ovalContainer.bounds
            blurView.alpha = 0.3
            
            ovalContainer.addSubview(blurView)
            
            scrollView.addSubview(ovalContainer)
            
            let textContainer = UIView()
            textContainer.frame = ovalContainer.bounds
            
            label.textAlignment = .center
            label.frame = textContainer.bounds
            label.textColor = .black
            label.text = label.text?.uppercased()
            textContainer.addSubview(label)
            
            ovalContainer.addSubview(textContainer)
            
            xPosition += ovalContainerWidth + ovalContainerSpacing
        }

        
        
        let containerWidth = UIScreen.main.bounds.width - 40
        let containerHeight: CGFloat = 378
        let containerX = (UIScreen.main.bounds.width - containerWidth) / 2
        let containerY = filterImageY + filterImageSize + 20
        let containerView = UIView(frame: CGRect(x: containerX, y: containerY, width: containerWidth, height: containerHeight))

        containerView.layer.cornerRadius = 32
        containerView.clipsToBounds = true

        let gradientLayerBlue = CAGradientLayer()
        gradientLayerBlue.frame = containerView.bounds
        gradientLayerBlue.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            UIColor(red: 0, green: 0.101, blue: 0.766, alpha: 0.54).cgColor,
            UIColor(red: 1, green: 0.509, blue: 0.509, alpha: 0).cgColor
        ]

        gradientLayerBlue.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayerBlue.endPoint = CGPoint(x: 0.5, y: 1)
        containerView.layer.addSublayer(gradientLayerBlue)

        let label = UILabel()
        label.text = "Зачем нужен наш сервис?"
        label.text = label.text?.uppercased()
        label.textColor = UIColor.white
        label.font = UIFont(name: "SuisseIntl-Bold", size: 24)
        label.frame = CGRect(x: 30, y: 40, width: containerView.frame.width - 60, height: 60)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        containerView.addSubview(label)

        let secondLabel = UILabel()
        secondLabel.text = "Прочитайте о нашем проекте"
        secondLabel.textColor = UIColor.white
        secondLabel.font = UIFont(name: "SuisseIntl-Medium", size: 20)
        secondLabel.frame = CGRect(x: 60, y: label.frame.origin.y + label.frame.size.height + 5, width: containerView.frame.width - 160, height: 60)
        secondLabel.numberOfLines = 0
        secondLabel.lineBreakMode = .byWordWrapping
        containerView.addSubview(secondLabel)

        let imageView = UIImageView(image: UIImage(named: "silverTrible"))
        imageView.frame = CGRect(x: 20, y: secondLabel.frame.origin.y - 50, width: 339, height: 366)
        containerView.addSubview(imageView)

        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(openAboutUsViewController), for: .touchUpInside)

        button.frame = CGRect(x: containerView.frame.width - 135 - 20, y: containerView.frame.height - 47 - 25, width: 140, height: 47)

        let ovalMaskLayerButton = CAShapeLayer()
        ovalMaskLayerButton.path = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.bounds.size.height / 2).cgPath
        button.layer.mask = ovalMaskLayerButton

        let borderLayerButton = CAShapeLayer()
        borderLayerButton.path = ovalMaskLayerButton.path
        borderLayerButton.strokeColor = UIColor.white.cgColor
        borderLayerButton.fillColor = UIColor.clear.cgColor
        borderLayerButton.lineWidth = 2.0
        button.layer.addSublayer(borderLayerButton)

        let gradientLayerButton = CAGradientLayer()
        gradientLayerButton.frame = button.bounds

        let startColorButton = UIColor(hex: 0xFFFFFF).cgColor
        let endColorButton = UIColor(hex: 0xF0EFEF).cgColor
        gradientLayerButton.colors = [startColorButton, endColorButton]

        gradientLayerButton.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayerButton.endPoint = CGPoint(x: 0.5, y: 1)
        button.layer.insertSublayer(gradientLayerButton, at: 0)

        let blurEffectButton = UIBlurEffect(style: .light)
        let blurViewButton = UIVisualEffectView(effect: blurEffectButton)
        blurViewButton.frame = button.bounds
        blurViewButton.alpha = 0.3
        blurViewButton.isUserInteractionEnabled = false
        blurViewButton.contentView.layer.addSublayer(gradientLayerButton)
        button.addSubview(blurViewButton)

        let labelSee = UILabel(frame: button.bounds)
        labelSee.text = "Прочитать"
        labelSee.textAlignment = .center
        labelSee.textColor = UIColor.black
        labelSee.font = UIFont(name: "SuisseIntl-Regular", size: 20)
        button.addSubview(labelSee)

        containerView.addSubview(button)
        scrollViewMain.addSubview(containerView)
        
        
        let titleMainYourSelection = UILabel()
        titleMainYourSelection.text = "ВАША ПОДБОРКА"
        titleMainYourSelection.textColor = .black
        titleMainYourSelection.font = UIFont(name: "SuisseIntl-Bold", size: 24)
        titleMainYourSelection.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewMain.addSubview(titleMainYourSelection)
        
        // Ограничения для UILabel
        titleMainYourSelection.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20).isActive = true
        titleMainYourSelection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        
        let collectionView1 = UIImageView(image: UIImage(named: "collectionExample1"))
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.layer.cornerRadius = 32
        collectionView1.clipsToBounds = true

        let likeButton = UIButton(type: .custom)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.addSubview(likeButton)
        likeButton.frame = CGRect(x: 20, y: 20, width: 54, height: 54)

        let likeImage1 = UIImageView(image: UIImage(named: "likeImage"))
        likeImage1.translatesAutoresizingMaskIntoConstraints = false
        likeButton.addSubview(likeImage1)
        likeImage1.widthAnchor.constraint(equalToConstant: 23).isActive = true
        likeImage1.heightAnchor.constraint(equalToConstant: 21).isActive = true
        likeImage1.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor).isActive = true
        likeImage1.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true

        let gradientLayerLikeButton = CAGradientLayer()
        gradientLayerLikeButton.frame = likeButton.bounds
        gradientLayerLikeButton.opacity = 0.6

        let startColorLikeButton = UIColor(hex: 0xFFFFFF).cgColor
        let endColorLikeButton = UIColor(hex: 0xF0EFEF).cgColor
        gradientLayerLikeButton.colors = [startColorLikeButton, endColorLikeButton]

        gradientLayerLikeButton.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayerLikeButton.endPoint = CGPoint(x: 0.5, y: 1)
        likeButton.layer.addSublayer(gradientLayerLikeButton)

        let ovalMaskLayerLikeButton = CAShapeLayer()
        ovalMaskLayerLikeButton.path = UIBezierPath(ovalIn: likeButton.bounds).cgPath
        likeButton.layer.mask = ovalMaskLayerLikeButton

        let borderLayerLikeButton = CAShapeLayer()
        borderLayerLikeButton.path = ovalMaskLayerLikeButton.path
        borderLayerLikeButton.strokeColor = UIColor.white.cgColor
        borderLayerLikeButton.fillColor = UIColor.clear.cgColor
        borderLayerLikeButton.lineWidth = 2.0
        likeButton.layer.addSublayer(borderLayerLikeButton)

        let blurEffectLikeButton = UIBlurEffect(style: .light)
        let blurViewLikeButton = UIVisualEffectView(effect: blurEffectLikeButton)
        blurViewLikeButton.frame = likeButton.bounds
        blurViewLikeButton.alpha = 0.3

        likeButton.addSubview(blurViewLikeButton)
        likeButton.addSubview(likeImage1)

        blurViewLikeButton.alpha = 0.3
        likeImage1.alpha = 1.0

        scrollViewMain.addSubview(collectionView1)

        likeButton.trailingAnchor.constraint(equalTo: collectionView1.trailingAnchor, constant: -20).isActive = true
        likeButton.topAnchor.constraint(equalTo: collectionView1.topAnchor, constant: 20).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 54).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 54).isActive = true

        collectionView1.topAnchor.constraint(equalTo: titleMainYourSelection.bottomAnchor, constant: 20).isActive = true
        collectionView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView1.widthAnchor.constraint(equalToConstant: 350).isActive = true
        collectionView1.heightAnchor.constraint(equalToConstant: 378).isActive = true

        
        
        let caption1 = UILabel()
        caption1.text = "Иллюстрация черепа с глазками"
        caption1.font = UIFont(name: "SuisseIntl-Regular", size: 19)
        caption1.translatesAutoresizingMaskIntoConstraints = false
        scrollViewMain.addSubview(caption1)
        caption1.leadingAnchor.constraint(equalTo: scrollViewMain.leadingAnchor, constant: 20).isActive = true
        caption1.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 15).isActive = true

        let tagLines = UIView()
        tagLines.backgroundColor = UIColor.black
        tagLines.translatesAutoresizingMaskIntoConstraints = false
        tagLines.layer.cornerRadius = 17.5
        tagLines.layer.masksToBounds = true
        scrollViewMain.addSubview(tagLines)
        tagLines.trailingAnchor.constraint(equalTo: scrollViewMain.superview!.trailingAnchor, constant: -20).isActive = true
        tagLines.topAnchor.constraint(equalTo: caption1.topAnchor).isActive = true
        tagLines.heightAnchor.constraint(equalToConstant: 35).isActive = true

        let labelTagLines = UILabel()
        labelTagLines.text = "КОНТУРЫ"
        labelTagLines.textColor = UIColor.white
        labelTagLines.font = UIFont(name: "SuisseIntl-Regular", size: 15)
        labelTagLines.translatesAutoresizingMaskIntoConstraints = false
        caption1.lineBreakMode = .byWordWrapping
        caption1.numberOfLines = 0
        caption1.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        tagLines.addSubview(labelTagLines)
        labelTagLines.centerXAnchor.constraint(equalTo: tagLines.centerXAnchor).isActive = true
        labelTagLines.centerYAnchor.constraint(equalTo: tagLines.centerYAnchor).isActive = true
        labelTagLines.leadingAnchor.constraint(equalTo: tagLines.leadingAnchor, constant: 25).isActive = true
        labelTagLines.trailingAnchor.constraint(equalTo: tagLines.trailingAnchor, constant: -25).isActive = true

        
        let collectionView2 = UIImageView(image: UIImage(named: "collectionExample2"))
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.layer.cornerRadius = 32
        collectionView2.clipsToBounds = true

        let likeButton2 = UIButton(type: .custom)
        likeButton2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.addSubview(likeButton2)
        likeButton2.frame = CGRect(x: 20, y: 20, width: 54, height: 54)

        let likeImage2 = UIImageView(image: UIImage(named: "likeImage"))
        likeImage2.translatesAutoresizingMaskIntoConstraints = false
        likeButton2.addSubview(likeImage2)
        likeImage2.widthAnchor.constraint(equalToConstant: 23).isActive = true
        likeImage2.heightAnchor.constraint(equalToConstant: 21).isActive = true
        likeImage2.centerXAnchor.constraint(equalTo: likeButton2.centerXAnchor).isActive = true
        likeImage2.centerYAnchor.constraint(equalTo: likeButton2.centerYAnchor).isActive = true

        let gradientLayerLikeButton2 = CAGradientLayer()
        gradientLayerLikeButton2.frame = likeButton2.bounds
        gradientLayerLikeButton2.opacity = 0.6
        let startColorLikeButton2 = UIColor(hex: 0xFFFFFF).cgColor
        let endColorLikeButton2 = UIColor(hex: 0xF0EFEF).cgColor
        gradientLayerLikeButton2.colors = [startColorLikeButton2, endColorLikeButton2]
        gradientLayerLikeButton2.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayerLikeButton2.endPoint = CGPoint(x: 0.5, y: 1)
        likeButton2.layer.addSublayer(gradientLayerLikeButton2)

        let ovalMaskLayerLikeButton2 = CAShapeLayer()
        ovalMaskLayerLikeButton2.path = UIBezierPath(ovalIn: likeButton2.bounds).cgPath
        likeButton2.layer.mask = ovalMaskLayerLikeButton2

        let borderLayerLikeButton2 = CAShapeLayer()
        borderLayerLikeButton2.path = ovalMaskLayerLikeButton2.path
        borderLayerLikeButton2.strokeColor = UIColor.white.cgColor
        borderLayerLikeButton2.fillColor = UIColor.clear.cgColor
        borderLayerLikeButton2.lineWidth = 2.0
        likeButton2.layer.addSublayer(borderLayerLikeButton2)

        let blurEffectLikeButton2 = UIBlurEffect(style: .light)
        let blurViewLikeButton2 = UIVisualEffectView(effect: blurEffectLikeButton2)
        blurViewLikeButton2.frame = likeButton2.bounds
        blurViewLikeButton2.alpha = 0.3
        likeButton2.addSubview(blurViewLikeButton2)
        likeButton2.addSubview(likeImage2)
        blurViewLikeButton2.alpha = 0.3
        likeImage2.alpha = 1.0

        scrollViewMain.addSubview(collectionView2)

        likeButton2.trailingAnchor.constraint(equalTo: collectionView2.trailingAnchor, constant: -20).isActive = true
        likeButton2.topAnchor.constraint(equalTo: collectionView2.topAnchor, constant: 20).isActive = true
        likeButton2.widthAnchor.constraint(equalToConstant: 54).isActive = true
        likeButton2.heightAnchor.constraint(equalToConstant: 54).isActive = true

        collectionView2.topAnchor.constraint(equalTo: caption1.bottomAnchor, constant: 25).isActive = true
        collectionView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView2.widthAnchor.constraint(equalToConstant: 350).isActive = true
        collectionView2.heightAnchor.constraint(equalToConstant: 378).isActive = true


        let caption2 = UILabel()
        caption2.text = "Абстрактные формы для Ромы"
        caption2.font = UIFont(name: "SuisseIntl-Regular", size: 19)
        caption2.translatesAutoresizingMaskIntoConstraints = false
        scrollViewMain.addSubview(caption2)
        caption2.leadingAnchor.constraint(equalTo: scrollViewMain.leadingAnchor, constant: 20).isActive = true
        caption2.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 20).isActive = true

        let tagTrible = UIView()
        tagTrible.backgroundColor = UIColor.black
        tagTrible.translatesAutoresizingMaskIntoConstraints = false
        tagTrible.layer.cornerRadius = 17.5
        tagTrible.layer.masksToBounds = true
        scrollViewMain.addSubview(tagTrible)
        tagTrible.trailingAnchor.constraint(equalTo: scrollViewMain.superview!.trailingAnchor, constant: -20).isActive = true
        tagTrible.topAnchor.constraint(equalTo: caption2.topAnchor).isActive = true
        tagTrible.heightAnchor.constraint(equalToConstant: 35).isActive = true

        let labelTagTrible = UILabel()
        labelTagTrible.text = "ТРАЙБЛЫ"
        labelTagTrible.textColor = UIColor.white
        labelTagTrible.font = UIFont(name: "SuisseIntl-Regular", size: 15)
        labelTagTrible.translatesAutoresizingMaskIntoConstraints = false
        caption2.lineBreakMode = .byWordWrapping
        caption2.numberOfLines = 0
        caption2.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        tagTrible.addSubview(labelTagTrible)
        labelTagTrible.centerXAnchor.constraint(equalTo: tagTrible.centerXAnchor).isActive = true
        labelTagTrible.centerYAnchor.constraint(equalTo: tagTrible.centerYAnchor).isActive = true
        labelTagTrible.leadingAnchor.constraint(equalTo: tagTrible.leadingAnchor, constant: 25).isActive = true
        labelTagTrible.trailingAnchor.constraint(equalTo: tagTrible.trailingAnchor, constant: -25).isActive = true

        let watchAllButton = UIButton()
        watchAllButton.backgroundColor = UIColor.black
        watchAllButton.setTitle("Смотреть все", for: .normal)
        watchAllButton.setTitleColor(UIColor.white, for: .normal)
        watchAllButton.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 19)
        watchAllButton.translatesAutoresizingMaskIntoConstraints = false
        watchAllButton.layer.cornerRadius = 20
        watchAllButton.layer.masksToBounds = true
        scrollViewMain.addSubview(watchAllButton)
        watchAllButton.centerXAnchor.constraint(equalTo: scrollViewMain.centerXAnchor).isActive = true
        watchAllButton.topAnchor.constraint(equalTo: tagTrible.bottomAnchor, constant: 50).isActive = true
        watchAllButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        watchAllButton.heightAnchor.constraint(equalToConstant: 47).isActive = true

        let newUserLabel = UILabel()
        newUserLabel.backgroundColor = UIColor.clear
        newUserLabel.text = "НОВЫЕ ПОЛЬЗОВАТЕЛИ"
        newUserLabel.textColor = UIColor.black
        newUserLabel.font = UIFont(name: "SuisseIntl-Bold", size: 24)
        newUserLabel.numberOfLines = 0
        newUserLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollViewMain.addSubview(newUserLabel)
        newUserLabel.leadingAnchor.constraint(equalTo: scrollViewMain.leadingAnchor, constant: 20).isActive = true
        newUserLabel.topAnchor.constraint(equalTo: watchAllButton.bottomAnchor, constant: 40).isActive = true
        newUserLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true

        var newUsersImageViews = [UIImageView]()

        let profileNames = ["@hardblank__", "@lika.saburenko", "@d.marinchenkov", "@13_bodytattoos", "@hanzai_boy", "@gorehex"]
        var lastImageView: UIImageView?
        var lastLabel: UILabel?
        var secondToLastLabel: UILabel?

        let profileImages = [UIImage(named: "avatar1"), UIImage(named: "avatar2"), UIImage(named: "avatar3"), UIImage(named: "avatar4"), UIImage(named: "avatar5"), UIImage(named: "avatar6")]

        
        for i in 0..<6 {
            let newUserImageView = UIImageView()
            newUserImageView.translatesAutoresizingMaskIntoConstraints = false
            newUserImageView.layer.cornerRadius = 82.5
            newUserImageView.clipsToBounds = true
            newUserImageView.contentMode = .scaleAspectFill
            newUserImageView.image = profileImages[i]
            scrollViewMain.addSubview(newUserImageView)
            newUsersImageViews.append(newUserImageView)
            newUserImageView.widthAnchor.constraint(equalToConstant: 165).isActive = true
            newUserImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true

            if i % 2 == 0 {
                newUserImageView.leadingAnchor.constraint(equalTo: scrollViewMain.leadingAnchor, constant: 20).isActive = true
            } else {
                newUserImageView.leadingAnchor.constraint(equalTo: lastImageView!.trailingAnchor, constant: 20).isActive = true
            }

            if i < 2 {
                newUserImageView.topAnchor.constraint(equalTo: newUserLabel.bottomAnchor, constant: 30).isActive = true
            } else {
                newUserImageView.topAnchor.constraint(equalTo: secondToLastLabel!.bottomAnchor, constant: 20).isActive = true
            }

            let nameLabel = UILabel()
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.text = profileNames[i]
            nameLabel.textColor = UIColor.gray
            nameLabel.font = UIFont(name: "SuisseIntl-Regular", size: 17)
            scrollViewMain.addSubview(nameLabel)

            nameLabel.leadingAnchor.constraint(equalTo: newUserImageView.leadingAnchor, constant: 5).isActive = true
            nameLabel.topAnchor.constraint(equalTo: newUserImageView.bottomAnchor, constant: 10).isActive = true

            secondToLastLabel = lastLabel
            lastImageView = newUserImageView
            lastLabel = nameLabel
        }

        
        
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

    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
                searchField.becomeFirstResponder()
                if sender.state == .ended {
                    let location = sender.location(in: view)
                    if !searchField.frame.contains(location) {
                searchField.resignFirstResponder()
            }
        }
    }
    
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
            
    }
    
    // MARK: - Change!
    
    @objc func openAboutUsViewController() {
            let aboutUsViewController = SO_MainPage()
            navigationController?.pushViewController(aboutUsViewController, animated: true)

        }
    
}
