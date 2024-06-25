//
//  SO_AboutUs.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 27/12/2023.
//
import UIKit
import MapKit

class SO_AboutUs: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let textLabel = UILabel()
    private let subTextLabel = UILabel()
    private let imageView = UIImageView()
    private let mapContainerView = UIView()
    private let mapView = MKMapView()
    
    let menu: OvalImageView = {
        let view = OvalImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Define colors for light theme
    private let lightTextColor = UIColor.black
    private let lightBackgroundColor = UIColor.white
    private let lightSubTextColor = UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1.0)
    private let lightButtonBackgroundColor = UIColor.systemBlue
    
    // Define colors for dark theme
    private let darkTextColor = UIColor.white
    private let darkBackgroundColor = UIColor.black
    private let darkSubTextColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
    private let darkButtonBackgroundColor = UIColor.systemGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        setupTextLabel()
        setupMap()

        let isDarkMode = traitCollection.userInterfaceStyle == .dark
        updateTheme(isDarkMode: isDarkMode)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            let isDarkMode = traitCollection.userInterfaceStyle == .dark
            updateTheme(isDarkMode: isDarkMode)
        }
    }
    
    private func updateTheme(isDarkMode: Bool) {
        let textColor = isDarkMode ? darkTextColor : lightTextColor
        let backgroundColor = isDarkMode ? darkBackgroundColor : lightBackgroundColor
        let subTextColor = isDarkMode ? darkSubTextColor : lightSubTextColor
        let buttonBackgroundColor = isDarkMode ? darkButtonBackgroundColor : lightButtonBackgroundColor
        
        textLabel.textColor = textColor
        subTextLabel.textColor = subTextColor
        contentView.backgroundColor = backgroundColor
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.backgroundColor = .white
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupTextLabel() {
        contentView.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "кто такие inkz?"
        textLabel.font = UIFont(name: "SuisseIntl-Medium", size: 36)
        textLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 63)
        ])
        
        subTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subTextLabel.text = "мы создаём удобный и информативный сервис, который поможет вам найти идеального тату-мастера."
        subTextLabel.font = UIFont.systemFont(ofSize: 16)
        subTextLabel.numberOfLines = 0
        subTextLabel.textAlignment = .center
        contentView.addSubview(subTextLabel)
        
        NSLayoutConstraint.activate([
            subTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 18),
            subTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            subTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        let imageView = UIImageView(image: UIImage(named: "W_AboutUsImages"))
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: subTextLabel.bottomAnchor, constant: 27),
            imageView.widthAnchor.constraint(equalToConstant: 320),
            imageView.heightAnchor.constraint(equalToConstant: 73),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        let findUsLabel = UILabel()
        contentView.addSubview(findUsLabel)
        findUsLabel.translatesAutoresizingMaskIntoConstraints = false
        findUsLabel.text = "как нас найти?"
        findUsLabel.font = UIFont(name: "SuisseIntl-Medium", size: 36)
        findUsLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            findUsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            findUsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        contentView.addSubview(mapContainerView)
        mapContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapContainerView.topAnchor.constraint(equalTo: findUsLabel.bottomAnchor, constant: 30),
            mapContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mapContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mapContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mapContainerView.heightAnchor.constraint(equalToConstant: 400),
            mapContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150)
        ])
        
        mapContainerView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: mapContainerView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: mapContainerView.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor)
        ])
        
        scrollView.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
    }
    
    private func setupMap() {
        let annotation = MKPointAnnotation()
        annotation.title = "Школа Дизайна НИУ ВШЭ"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 55.728, longitude: 37.635)
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
}

extension SO_AboutUs: MKMapViewDelegate {
}
