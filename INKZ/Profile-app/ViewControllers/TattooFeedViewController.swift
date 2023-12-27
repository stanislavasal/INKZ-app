//
//  MasterFeedViewController.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 24/12/2023.
//

import UIKit

class MasterFeedViewController: UIViewController {

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
}

