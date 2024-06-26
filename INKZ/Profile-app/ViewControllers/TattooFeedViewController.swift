import UIKit

class SO_TattooFeed: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let textLabel = UILabel()
    
    let menu: OvalImageView = {
        let view = OvalImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var tattoosData: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        setupTextLabel()
        fetchData()
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
        textLabel.text = "лента"
        textLabel.font = UIFont(name: "SuisseIntl-Medium", size: 48)
        textLabel.textColor = .black
        textLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        view.addSubview(menu)
        
        NSLayoutConstraint.activate([
            menu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menu.topAnchor.constraint(equalTo: view.topAnchor, constant: 710),
            menu.widthAnchor.constraint(equalToConstant: 290),
            menu.heightAnchor.constraint(equalToConstant: 65),
        ])
    }
    
    private func fetchData() {
        guard let url = URL(string: "http://localhost:2000/api/v1/tattoos.json") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let tattoos = json["tattoos"] as? [[String: Any]] {
                        self.tattoosData = tattoos
                        DispatchQueue.main.async {
                            self.setupImages()
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    private func setupImages() {
        var previousImageView: UIImageView?
        
        for (index, tattoo) in tattoosData.enumerated() {
            guard let imageUrlString = tattoo["tattoo_image"] as? String,
                  let imageUrl = URL(string: imageUrlString) else {
                continue
            }
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            
            contentView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
            
            if let previous = previousImageView {
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 20)
                ])
            } else {
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110)
                ])
            }
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                        let scaledWidth = image.size.width / 1.6
                        let scaledHeight = image.size.height / 1.6
                        imageView.widthAnchor.constraint(equalToConstant: scaledWidth).isActive = true
                        imageView.heightAnchor.constraint(equalToConstant: scaledHeight).isActive = true
                    }
                }
            }
            
            previousImageView = imageView
            
            if index == tattoosData.count - 1, let lastImageView = previousImageView {
                NSLayoutConstraint.activate([
                    lastImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
                ])
            }
        }
    }
}
