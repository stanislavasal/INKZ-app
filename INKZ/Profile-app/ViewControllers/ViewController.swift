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
    
    let menu: OvalImageView = {
        let view = OvalImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(profileStorage: ProfileStorageLogic = ProfileStorageWorker()) {
        self.profileStorage = profileStorage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0xF3F3F3)
        configureUI()
        loadProfile()
        
        
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
        
        view.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
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

