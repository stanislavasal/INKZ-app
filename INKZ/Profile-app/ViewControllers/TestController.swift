//
//  TattooFeedViewController.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 23/12/2023.
//

import UIKit

class SO_MasterFeed: UIViewController {

    let customContainerView: C_TitleCategoryPageLibrary = {
        let view = C_TitleCategoryPageLibrary()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let rightImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Q_ProfileIcon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let leftImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Q_ProfileIcon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(customContainerView)
        view.addSubview(rightImageView)
        view.addSubview(leftImageView)

        customContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
            customContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            rightImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            rightImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightImageView.widthAnchor.constraint(equalToConstant: 50),
            rightImageView.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            leftImageView.centerYAnchor.constraint(equalTo: rightImageView.centerYAnchor),
            leftImageView.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: -20),
            leftImageView.widthAnchor.constraint(equalToConstant: 50),
            leftImageView.heightAnchor.constraint(equalToConstant: 50),
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        view.endEditing(true)
    }
}
