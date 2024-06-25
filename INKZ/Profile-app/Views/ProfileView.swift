//
//  ProfileView.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 04/10/2023.
//

import UIKit

class ProfileView: UIView {
    
    private struct Constants {
        static let defaultAvatar: String = "avatar"
        static let saveTitle: String = "Save"
        static let cancelTitle: String = "Cancel"
        static let avatarRadius: CGFloat = 100
        static let offset: CGFloat = 9
        static let offsetFirst: CGFloat = 15
        static let horizontalOffset: CGFloat = 20
        static let topOffset: CGFloat = 10
        static let fieldHeight: CGFloat = 45


    }
    
    let avatarImage = UIImageView()
    let firstNameField = UITextField()
    let secondNameField = UITextField()
    let middleNameField = UITextField()
    let aliasField = UITextField()
    let mailField = UITextField()
    let phoneField = UITextField()
    let telegramField = UITextField()
    
    let saveButton = UIButton()
    let cancelButton = UIButton()
    
    public var saveAction: (() -> Void)?
    public var cancelAction: (() -> Void)?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setAvatar(_ avatar: String) {
        avatarImage.image = avatar.toImage()
    }
    
    public func setAvatar(_ avatar: UIImage) {
        avatarImage.image = avatar
    }
 
    private func configureUI() {
        self.backgroundColor = UIColor(hex: 0xF3F3F3)
        configureAvatar()
        configureFields()
        configureButtons()
    }
    
    public func configure(profile: ProfileModel) {
//        avatarImage.image = UIImage(named: profile.avatar ?? Constants.defaultAvatar)
//        profile.avatar?.toImage() ?? UIImage(named: Constants.defaultAvatar)
        
        avatarImage.image = profile.avatar?.toImage() ?? UIImage(named: Constants.defaultAvatar)
        avatarImage.backgroundColor = .black
        firstNameField.text = profile.firstName
        secondNameField.text = profile.secondName
        middleNameField.text = profile.middleName
        aliasField.text = profile.alias
        mailField.text = profile.mail
        phoneField.text = profile.phone
        telegramField.text = profile.telegram
    }
    
    private func configureAvatar() {
        self.addSubview(avatarImage)
        avatarImage.layer.cornerRadius = Constants.avatarRadius
        avatarImage.layer.masksToBounds = true
        avatarImage.frame.size = CGSize(width: 200.0, height: 200.0)
        avatarImage.backgroundColor = UIColor.cyan
        avatarImage.image = UIImage(named: Constants.defaultAvatar)
        
        avatarImage.setWidth(Constants.avatarRadius * 2)
        avatarImage.setHeight(Constants.avatarRadius * 2)
        avatarImage.pinCenterX(to: self)
        avatarImage.pinTop(to: self, Constants.topOffset)
        
    }
    
    private func configureFields() {
        
        configureField(firstNameField)
        firstNameField.backgroundColor = UIColor(hex: 0xFFFFFF)
        firstNameField.placeholder = "First name"
        firstNameField.pinTop(to: avatarImage.bottomAnchor, Constants.offsetFirst)
        
        configureField(secondNameField)
        secondNameField.backgroundColor = UIColor(hex: 0xFFFFFF)
        secondNameField.placeholder = "Second name"
        secondNameField.pinTop(to: firstNameField.bottomAnchor, Constants.offset)
        
        configureField(middleNameField)
        middleNameField.backgroundColor = UIColor(hex: 0xFFFFFF)
        middleNameField.placeholder = "Middle name"
        middleNameField.pinTop(to: secondNameField.bottomAnchor, Constants.offset)
        
        configureField(aliasField)
        aliasField.backgroundColor = UIColor(hex: 0xFFFFFF)
        aliasField.placeholder = "First name"
        aliasField.pinTop(to: middleNameField.bottomAnchor, Constants.offset)
        
        configureField(mailField)
        mailField.backgroundColor = UIColor(hex: 0xFFFFFF)
        mailField.placeholder = "E-mail"
        mailField.pinTop(to: aliasField.bottomAnchor, Constants.offset)
        
        configureField(phoneField)
        phoneField.backgroundColor = UIColor(hex: 0xFFFFFF)
        phoneField.placeholder = "Phone number"
        phoneField.pinTop(to: mailField.bottomAnchor, Constants.offset)
        
        configureField(telegramField)
        telegramField.backgroundColor = UIColor(hex: 0xFFFFFF)
        telegramField.placeholder = "Telegram"
        telegramField.pinTop(to: phoneField.bottomAnchor, Constants.offset)


    }
    
    private func configureField(_ field: UITextField) {
        self.addSubview(field)
        field.pinHorizontal(to: self, Constants.horizontalOffset)
        field.setHeight(Constants.fieldHeight)
        field.resignFirstResponder()
        field.selectedTextRange = nil
        field.textColor = .black
        field.layer.borderWidth = 1.5
        field.layer.borderColor = UIColor(hex: 0x737373).cgColor

        field.layer.cornerRadius = Constants.fieldHeight / 5
        field.layer.masksToBounds = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: Constants.fieldHeight))
        field.leftView = leftView
        field.leftViewMode = .always
    }
    
    private func configureButtons() {
            let view = UIView()
            self.addSubview(view)
            view.pinBottom(to: self, Constants.offset)
            view.pinHorizontal(to: self, Constants.horizontalOffset)
            
            view.addSubview(saveButton)
            saveButton.setTitle(Constants.saveTitle, for: .normal)
            saveButton.setTitleColor(.black, for: .normal)
            saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
            saveButton.pinRight(to: view)
            saveButton.pinBottom(to: view, Constants.offset)
            // ...
            
            view.addSubview(cancelButton)
            cancelButton.setTitle(Constants.cancelTitle, for: .normal)
            cancelButton.setTitleColor(.black, for: .normal)
            cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
            cancelButton.pinBottom(to: view, Constants.offset)
            cancelButton.pinLeft(to: view)
            
            view.pinHeight(to: saveButton.heightAnchor)
        }






    
    @objc
    private func save() {
        saveAction?()
    }
    
    @objc
    private func cancel() {
        cancelAction?()
    }
    
}
