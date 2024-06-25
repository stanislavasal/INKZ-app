//
//  SO_WriteUs.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 29/10/2023.
//

import UIKit
import MessageUI

class SO_WriteUs: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate {

    let menu: OvalImageView = {
        let view = OvalImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите сообщение"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftViewMode = .always
        return textField
    }()

    
    lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отправить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()

        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        updateTheme(isDarkMode: isDarkMode)
    }
    
    // MARK: - Setup UI
    
    private func setupViews() {
        let label = UILabel()
        label.text = "свяжитесь с нами"
        label.font = UIFont(name: "SuisseIntl-Medium", size: 36)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
        
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            messageTextField.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        messageTextField.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        messageTextField.layer.cornerRadius = 8
        messageTextField.layer.borderWidth = 2
        messageTextField.layer.borderColor = UIColor.black.cgColor
        messageTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        messageTextField.leftViewMode = .always

        
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 20),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        sendButton.titleLabel?.font = UIFont(name: "SuisseIntl-Regular", size: 16)
        sendButton.backgroundColor = .black
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius = 8
        
        view.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
    }

    
    // MARK: - Email Sending
    
    @objc private func sendEmail() {
        messageTextField.text = ""
        
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(title: "Невозможно отправить письмо", message: "Настройте почтовый аккаунт на устройстве", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["inkztattoo@yandex.ru"])
        
        let messageBody = messageTextField.text ?? ""
        mailComposer.setSubject("Сообщение от приложения")
        mailComposer.setMessageBody(messageBody, isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }

    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Theme Switching
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            updateTheme(isDarkMode: isDarkMode)
        }
    }
    
    private func updateTheme(isDarkMode: Bool) {
        let textColor = isDarkMode ? UIColor.white : UIColor.black
        let backgroundColor = isDarkMode ? UIColor.black : UIColor.white
        let buttonColor = isDarkMode ? UIColor.white : UIColor.black
        
        view.backgroundColor = backgroundColor
        messageTextField.textColor = textColor
        messageTextField.backgroundColor = backgroundColor
        messageTextField.layer.borderColor = textColor.cgColor
        sendButton.backgroundColor = buttonColor
        sendButton.setTitleColor(backgroundColor, for: .normal)
    }
}

