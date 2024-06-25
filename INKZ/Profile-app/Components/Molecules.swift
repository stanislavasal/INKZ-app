//
//  Molecules.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 26/12/2023.
//
import UIKit

struct Sizes {
    var width: CGFloat
    var height: CGFloat
}

class OvalImageView: UIView {

    private let imageInfo = [
        ("iconMenu1", Sizes(width: 40.0, height: 40.0)),
        ("iconMenu2", Sizes(width: 40.0, height: 40.0)),
        ("iconMenu3", Sizes(width: 40.0, height: 40.0)),
        ("iconMenu4", Sizes(width: 40.0, height: 40.0))
    ]
    private let spacing: CGFloat = 15.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addImageViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        addImageViews()
    }

    private func setup() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.5
    }

    private func addImageViews() {
        let ovalCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        var totalWidth: CGFloat = 0.0

        for (index, (imageName, size)) in imageInfo.enumerated() {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(
                x: ovalCenter.x + totalWidth + 40,
                y: ovalCenter.y + 11,
                width: size.width,
                height: size.height
            )
            imageView.tag = index
            addSubview(imageView)

            totalWidth += size.width + spacing

            if imageName == "iconMenu1" {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageMenu1Tap))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }
            
            if imageName == "iconMenu2" {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageMenu2Tap))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }
            
            if imageName == "iconMenu3" {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageMenu3Tap))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }
            
            if imageName == "iconMenu4" {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageMenu4Tap))
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(tapGesture)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2.0
    }
    
    @objc private func handleImageMenu1Tap() {
        let tattooFeedViewController = SO_MainPage()
        if let viewController = self.firstAvailableUIViewController() {
            viewController.navigationController?.pushViewController(tattooFeedViewController, animated: true)
        }
    }

    @objc private func handleImageMenu2Tap() {
        let tattooFeedViewController = SO_TattooFeed()
        if let viewController = self.firstAvailableUIViewController() {
            viewController.navigationController?.pushViewController(tattooFeedViewController, animated: true)
        }
    }
    
    
    @objc private func handleImageMenu3Tap() {
        let tattooFeedViewController = SO_WriteUs()
        if let viewController = self.firstAvailableUIViewController() {
            viewController.navigationController?.pushViewController(tattooFeedViewController, animated: true)
        }
    }
    
    @objc private func handleImageMenu4Tap() {
        let tattooFeedViewController = ViewController()
        if let viewController = self.firstAvailableUIViewController() {
            viewController.navigationController?.pushViewController(tattooFeedViewController, animated: true)
        }
    }
}

extension UIResponder {
    func firstAvailableUIViewController() -> UIViewController? {
        return self as? UIViewController ?? next?.firstAvailableUIViewController()
    }
}
