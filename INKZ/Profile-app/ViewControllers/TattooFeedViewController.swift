//
//  MasterFeedViewController.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 24/12/2023.
//

import UIKit

class SO_TattooFeed: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let searchAndFilters: С_SearchAndFiltersTattoo = {
        let view = С_SearchAndFiltersTattoo()
        return view
    }()

    let populatTitle: C_TitleCategoryPagePopular = {
        let view = C_TitleCategoryPagePopular()
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
    
    let favoritesCard: W_PopularTattooCard = {
        let view = W_PopularTattooCard()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favoritesCard2: W_PopularTattooCard2 = {
        let view = W_PopularTattooCard2()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let favoritesCard3: W_PopularTattooCard3 = {
        let view = W_PopularTattooCard3()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let allWorksTitle: C_TitleAllWorks = {
        let view = C_TitleAllWorks()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let menu: OvalImageView = {
        let view = OvalImageView()
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
        scrollView.addSubview(searchAndFilters)
        scrollView.addSubview(populatTitle)
        scrollView.addSubview(favoritesCard)
        scrollView.addSubview(favoritesCard2)
        scrollView.addSubview(favoritesCard3)
        scrollView.addSubview(allWorksTitle)
        scrollView.addSubview(rightImageView)
        scrollView.addSubview(leftImageView)
        scrollView.addSubview(menu)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        searchAndFilters.translatesAutoresizingMaskIntoConstraints = false
        populatTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            populatTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 105),
            populatTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            populatTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            populatTitle.heightAnchor.constraint(equalToConstant: 80),
            populatTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
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
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Центрирование по горизонтали
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710), // Отступ от верхней границы
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard.topAnchor.constraint(equalTo: populatTitle.bottomAnchor, constant: 10),
            favoritesCard.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard.heightAnchor.constraint(equalToConstant: 530),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard2.topAnchor.constraint(equalTo: favoritesCard.bottomAnchor, constant: 20),
            favoritesCard2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard2.heightAnchor.constraint(equalToConstant: 530),
        ])
        
        NSLayoutConstraint.activate([
            favoritesCard3.topAnchor.constraint(equalTo: favoritesCard2.bottomAnchor, constant: 20),
            favoritesCard3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            favoritesCard3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            favoritesCard3.heightAnchor.constraint(equalToConstant: 530),
        ])
        
        NSLayoutConstraint.activate([
            allWorksTitle.topAnchor.constraint(equalTo: favoritesCard3.topAnchor, constant: 600),
            allWorksTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            allWorksTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            allWorksTitle.heightAnchor.constraint(equalToConstant: 80),
            allWorksTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            searchAndFilters.topAnchor.constraint(equalTo: allWorksTitle.bottomAnchor, constant: 20),
            searchAndFilters.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            searchAndFilters.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            searchAndFilters.heightAnchor.constraint(equalToConstant: 120),
            searchAndFilters.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        
        

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap() {
        view.endEditing(true)
    }
}

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fetchDataFromAPI()
//    }
//
//
//
//    // MARK: - Переделать под асинхронный как в Tattoo
//
//
//
//
//
//    private func configureCardView(withName name: String, nickname: String) -> UIView {
//        let cardView = UIView()
//        cardView.backgroundColor = .gray
//        cardView.layer.cornerRadius = 10
//        cardView.layer.masksToBounds = true
//
//        let nameLabel = UILabel()
//        nameLabel.text = name
//        nameLabel.textColor = .black
//        nameLabel.textAlignment = .center
//
//        let nicknameLabel = UILabel()
//        nicknameLabel.text = nickname
//        nicknameLabel.textColor = .black
//        nicknameLabel.textAlignment = .center
//
//        let stackView = UIStackView(arrangedSubviews: [nameLabel, nicknameLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        cardView.addSubview(stackView)
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
//            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
//            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
//            stackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
//        ])
//
//        return cardView
//    }
//
//    private func fetchDataFromAPI() {
//        guard let url = URL(string: "http://127.0.0.1:2000/api/v1/masters.json") else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                print("Data is nil")
//                return
//            }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
//                DispatchQueue.main.async {
//                    self?.createCardViews(from: json)
//                }
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//
//    private func createCardViews(from json: [[String: Any]]?) {
//        guard let json = json else { return }
//
//        let mainView = UIView()
//        mainView.backgroundColor = .orange
//        view.addSubview(mainView)
//
//        let scrollView = UIScrollView()
//        mainView.addSubview(scrollView)
//
//        var yOffset: CGFloat = 20
//
//        for item in json {
//            if let name = item["name"] as? String, let nickname = item["nickname"] as? String {
//                let cardView = configureCardView(withName: name, nickname: nickname)
//                cardView.frame = CGRect(x: 20, y: yOffset, width: view.frame.width - 40, height: 100)
//                scrollView.addSubview(cardView)
//
//                yOffset += 120
//            }
//        }
//
//        mainView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: yOffset + 20)
//
//        scrollView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 70)
//        scrollView.contentSize = CGSize(width: view.frame.width, height: yOffset)
//    }
