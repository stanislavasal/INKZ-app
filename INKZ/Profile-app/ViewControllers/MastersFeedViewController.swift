//
//  MastersFeedViewController.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 27/12/2023.
//

import UIKit

class SO_MastersFeed: UIViewController {

    let searchAndFilters: С_SearchAndFiltersStyles = {
        let view = С_SearchAndFiltersStyles()
        return view
    }()

    let customContainerView: CustomContainerWithBorderView = {
        let view = CustomContainerWithBorderView()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(searchAndFilters)
        view.addSubview(customContainerView)
        view.addSubview(rightImageView)
        view.addSubview(leftImageView)

        searchAndFilters.translatesAutoresizingMaskIntoConstraints = false
        customContainerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
            customContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            customContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            searchAndFilters.topAnchor.constraint(equalTo: customContainerView.bottomAnchor, constant: 90),
            searchAndFilters.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchAndFilters.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchAndFilters.heightAnchor.constraint(equalToConstant: 120),
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

//class TattooFeedViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fetchDataFromAPI()
//    }
//
//    private func configureCardView(withTitle title: String, imageUrl: String) -> UIView {
//        let cardView = UIView()
//        cardView.backgroundColor = .gray
//        cardView.layer.cornerRadius = 10
//        cardView.layer.masksToBounds = true
//
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.textColor = .black
//        titleLabel.textAlignment = .center
//
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//
//        if let url = URL(string: imageUrl) {
//            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//                guard let data = data, error == nil else { return }
//
//                DispatchQueue.main.async {
//                    imageView.image = UIImage(data: data)
//                }
//            }.resume()
//        }
//
//        let stackView = UIStackView(arrangedSubviews: [titleLabel, imageView])
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
//        guard let url = URL(string: "http://127.0.0.1:2000/api/v1/tattoos.json") else { return }
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
//            if let title = item["title"] as? String, let imageUrl = item["tattoo_image"] as? String {
//                let cardView = configureCardView(withTitle: title, imageUrl: imageUrl)
//                cardView.frame = CGRect(x: 20, y: yOffset, width: view.frame.width - 40, height: 150)
//                scrollView.addSubview(cardView)
//
//                yOffset += 170
//            }
//        }
//
//        mainView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: yOffset + 20)
//
//        scrollView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height - 70)
//        scrollView.contentSize = CGSize(width: view.frame.width, height: yOffset)
//    }
//}
