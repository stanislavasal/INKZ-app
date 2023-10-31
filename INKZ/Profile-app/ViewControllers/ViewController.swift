//
//  ViewController.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 04/10/2023.
//

import UIKit

class ViewController: UIViewController {

    let profileView = ProfileView()
    var profileStorage: ProfileStorageLogic
    var profile: ProfileModel = ProfileModel()
    var avatar: String? = nil
    
    init(profileStorage: ProfileStorageLogic = ProfileStorageWorker()) {
        self.profileStorage = profileStorage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xE3E3E3)
        configureUI()
        loadProfile()
        
        
        let menuView = UIView()
        menuView.frame = CGRect(x: (view.frame.width - 255) / 2, y: 685, width: 255, height: 62)
        menuView.backgroundColor = UIColor.clear
        
        let menuMaskLayer = CAShapeLayer()
        menuMaskLayer.path = UIBezierPath(roundedRect: menuView.bounds, cornerRadius: menuView.frame.height / 2).cgPath
        menuView.layer.mask = menuMaskLayer
        
        let menuBorderLayer = CAShapeLayer()
        menuBorderLayer.path = menuMaskLayer.path
        menuBorderLayer.strokeColor = UIColor.white.cgColor
        menuBorderLayer.fillColor = UIColor.clear.cgColor
        menuBorderLayer.lineWidth = 2.0
        menuView.layer.addSublayer(menuBorderLayer)
        
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
        menuBlurView.alpha = 0.4
        
        menuBlurView.contentView.layer.addSublayer(menuGradientLayer)
        menuView.addSubview(menuBlurView)
        
        view.addSubview(menuView)
        
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
        
    }
    
    private func configureUI() {
        view.addSubview(profileView)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        profileView.saveAction = saveProfile
        profileView.cancelAction = loadProfile
        
        profileView.pinHorizontal(to: view)
        profileView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        profileView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        
        profileView.cancelAction = loadProfile
        profileView.saveAction = saveProfile
        
        profileView.avatarImage.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        profileView.avatarImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func saveProfile() {
        let newProfile = ProfileModel(
            avatar: avatar,
            firstName: profileView.firstNameField.text ?? "",
            secondName: profileView.secondNameField.text ?? "",
            middleName: profileView.middleNameField.text ?? "",
            alias: profileView.aliasField.text ?? "",
            mail: profileView.mailField.text ?? "",
            phone: profileView.phoneField.text ?? "",
            telegram: profileView.telegramField.text ?? "")
        profileStorage.save(newProfile)
    }
    
    private func loadProfile() {
        profile = profileStorage.read()
        profileView.configure(profile: profile)
    }
    
    private func loadImage(image: UIImage) {
        profileView.setAvatar(image)
        avatar = image.toPngString()
        if let avatar = avatar {
            profileView.setAvatar(avatar)
        }
    }
    
    @objc
    private func pickImage() {
        ImagePickerManager().pickImage(self) { image in
            self.loadImage(image: image)
        }
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func openMainViewController() {
        // Check if the current view controller is already MainViewController
        if let navigationController = navigationController, navigationController.topViewController is MainViewController {
            // We are already on MainViewController, no need to transition again
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
        // Check if the current view controller is already MainViewController
        if let navigationController = navigationController, navigationController.topViewController is ViewController {
            // We are already on ViewController, no need to transition again
            return
        }

        let viewController = ViewController()
        navigationController?.pushViewController(viewController, animated: true)

    }

}

