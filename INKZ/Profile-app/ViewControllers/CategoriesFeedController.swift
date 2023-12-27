//
//  MainViewController.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 27/10/2023.
//

import UIKit

class SO_CategoriesFeed: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

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
        let imageView = UIImageView(image: UIImage(named: "Q_FavouritesIcon"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let customCardView: W_SeeAllWorksCard = {
        let view = W_SeeAllWorksCard()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let articlesCategoryPage1: W_ArticlesCategoryPage1 = {
            let view = W_ArticlesCategoryPage1()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let articlesCategoryPage2: W_ArticlesCategoryPage2 = {
            let view = W_ArticlesCategoryPage2()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    let populatTitle: C_TitleCategoryPagePopular = {
        let view = C_TitleCategoryPagePopular()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favoritesCard: W_PopularCategoriesCardRealism = {
        let view = W_PopularCategoriesCardRealism()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favoritesCard2: W_PopularCategoriesCardIsrosumy = {
        let view = W_PopularCategoriesCardIsrosumy()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favoritesCard3: W_PopularCategoriesCardOldSchool = {
        let view = W_PopularCategoriesCardOldSchool()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let allCatTitle: C_TitleCategoryPageAll = {
        let view = C_TitleCategoryPageAll()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationController?.isNavigationBarHidden = true
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(customContainerView)
        scrollView.addSubview(customCardView)
        scrollView.addSubview(articlesCategoryPage1)
        scrollView.addSubview(articlesCategoryPage2)
        scrollView.addSubview(populatTitle)
        scrollView.addSubview(favoritesCard)
        scrollView.addSubview(favoritesCard2)
        scrollView.addSubview(favoritesCard3)
        scrollView.addSubview(allCatTitle)
        scrollView.addSubview(rightImageView)
        scrollView.addSubview(leftImageView)
        
        let rightTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleRightImageViewTap))
            rightImageView.addGestureRecognizer(rightTapGesture)
            rightImageView.isUserInteractionEnabled = true

            // Add tap gesture recognizer to leftImageView for transitioning to SO_TattooFeed
        let leftTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLeftImageViewTap))
            leftImageView.addGestureRecognizer(leftTapGesture)
            leftImageView.isUserInteractionEnabled = true

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        customContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 115),
            customContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            customContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            customContainerView.heightAnchor.constraint(equalToConstant: 80),
            customContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
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

        NSLayoutConstraint.activate([
            customCardView.topAnchor.constraint(equalTo: customContainerView.bottomAnchor, constant: 10),
            customCardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            customCardView.widthAnchor.constraint(equalToConstant: 350),
            customCardView.heightAnchor.constraint(equalToConstant: 485),
        ])
        
        NSLayoutConstraint.activate([
            articlesCategoryPage1.topAnchor.constraint(equalTo: customCardView.bottomAnchor, constant: 155),
            articlesCategoryPage1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            articlesCategoryPage1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            articlesCategoryPage1.heightAnchor.constraint(equalToConstant: 189),
        ])
        
        NSLayoutConstraint.activate([
            articlesCategoryPage2.topAnchor.constraint(equalTo: articlesCategoryPage1.bottomAnchor, constant: 20),
            articlesCategoryPage2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            articlesCategoryPage2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            articlesCategoryPage2.heightAnchor.constraint(equalToConstant: 189),
        ])
        
        NSLayoutConstraint.activate([
            populatTitle.topAnchor.constraint(equalTo: articlesCategoryPage2.topAnchor, constant: 115),
            populatTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            populatTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            populatTitle.heightAnchor.constraint(equalToConstant: 80),
            populatTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard.topAnchor.constraint(equalTo: populatTitle.bottomAnchor, constant: 10),
            favoritesCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard.heightAnchor.constraint(equalToConstant: 450),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard2.topAnchor.constraint(equalTo: favoritesCard.bottomAnchor, constant: 20),
            favoritesCard2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard2.heightAnchor.constraint(equalToConstant: 450),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard3.topAnchor.constraint(equalTo: favoritesCard2.bottomAnchor, constant: 20),
            favoritesCard3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard3.heightAnchor.constraint(equalToConstant: 450),
        ])
        
        NSLayoutConstraint.activate([
            allCatTitle.topAnchor.constraint(equalTo: favoritesCard3.topAnchor, constant: 500),
            allCatTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            allCatTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            allCatTitle.heightAnchor.constraint(equalToConstant: 80),
            allCatTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            allCatTitle.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        scrollView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        view.endEditing(true)
    }
    
    @objc private func handleRightImageViewTap() {
        // Transition to SO_MastersFeed
        let mastersFeedViewController = SO_MastersFeed() // Assuming SO_MastersFeed is a UIViewController subclass
        navigationController?.pushViewController(mastersFeedViewController, animated: true)
    }

    @objc private func handleLeftImageViewTap() {
        // Transition to SO_TattooFeed
        let tattooFeedViewController = SO_TattooFeed() // Assuming SO_TattooFeed is a UIViewController subclass
        navigationController?.pushViewController(tattooFeedViewController, animated: true)
    }
}
