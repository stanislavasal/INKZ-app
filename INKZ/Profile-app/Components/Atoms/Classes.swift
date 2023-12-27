//
//  Atoms.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 26/12/2023.
//

import UIKit

class A_ButtonLong: UIButton {
    init() {
        super.init(frame: .zero)
        configureButtonStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButtonStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func configureButtonStyle() {
        backgroundColor = A_ButtonStyles.Colors.backgroundColor
        setTitleColor(A_ButtonStyles.Colors.textColor, for: .normal)
        layer.cornerRadius = A_ButtonStyles.CornerRadius.cornerRadius
        frame = CGRect(x: 0, y: 0, width: A_ButtonStyles.Sizes.widthLong, height: A_ButtonStyles.Sizes.height)
        titleLabel?.font = UIFont.systemFont(ofSize: A_ButtonStyles.Sizes.fontSize)
    }
    
}

class A_ButtonShort: UIButton {
    init() {
        super.init(frame: .zero)
        configureButtonStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButtonStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButtonStyle()
    }
    
    private func configureButtonStyle() {
        backgroundColor = A_ButtonStyles.Colors.backgroundColor
        setTitleColor(A_ButtonStyles.Colors.textColor, for: .normal)
        layer.cornerRadius = A_ButtonStyles.CornerRadius.cornerRadius
        frame = CGRect(x: 0, y: 0, width: A_ButtonStyles.Sizes.widthShort, height: A_ButtonStyles.Sizes.height)
        titleLabel?.font = UIFont.systemFont(ofSize: A_ButtonStyles.Sizes.fontSize)
    }
    
}


class W_Search: UITextField {
    init() {
        super.init(frame: .zero)
        configureTextFieldStyle()
        delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextFieldStyle()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTextFieldStyle()
        delegate = self
    }
    
    private func configureTextFieldStyle() {
        backgroundColor = A_TextFieldStyles.Colors.backgroundColor
        textColor = A_TextFieldStyles.Colors.textColor
        layer.cornerRadius = A_TextFieldStyles.CornerRadius.cornerRadius
        layer.borderWidth = 1.5
        layer.borderColor = A_TextFieldStyles.Colors.borderColor.cgColor
        frame = CGRect(x: A_TextFieldStyles.Sizes.horizontalPadding, y: 0, width: A_TextFieldStyles.Sizes.width, height: A_TextFieldStyles.Sizes.height)
        font = UIFont.systemFont(ofSize: A_TextFieldStyles.Sizes.fontSize)
        placeholder = "Поиск"
        contentVerticalAlignment = .center
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: A_TextFieldStyles.Sizes.horizontalPadding, height: A_TextFieldStyles.Sizes.height))
        leftViewMode = .always
        isUserInteractionEnabled = true
    }
}

extension W_Search: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Метод вызывается при начале редактирования текстового поля (когда появляется клавиатура)
        // Можно добавить дополнительную логику при появлении клавиатуры
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Метод вызывается при завершении редактирования текстового поля (когда клавиатура скрывается)
        // Можно добавить дополнительную логику при скрытии клавиатуры
    }
}


class W_Filter: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = W_FilterStyles.Colors.textColor
        label.font = UIFont.systemFont(ofSize: W_FilterStyles.Sizes.fontSize)
        return label
    }()
    
    let triangleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Q_FilterArrow"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // Add a text parameter to the initializer
    init(text: String) {
        super.init(frame: .zero)
        setupUI(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI("")
    }
    
    private func setupUI(_ text: String) {
        layer.cornerRadius = W_FilterStyles.CornerRadius.cornerRadius
        layer.borderWidth = 1.5
        layer.borderColor = W_FilterStyles.Colors.borderColor.cgColor
        
        addSubview(label)
        addSubview(triangleImageView)
        
        // Use the provided text parameter
        label.text = text
        
        label.translatesAutoresizingMaskIntoConstraints = false
        triangleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: W_FilterStyles.Sizes.horizontalPadding),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            triangleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -W_FilterStyles.Sizes.horizontalPadding),
            triangleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            triangleImageView.widthAnchor.constraint(equalToConstant: Q_FilterArrowStyles.Sizes.width),
            triangleImageView.heightAnchor.constraint(equalToConstant: Q_FilterArrowStyles.Sizes.height)
        ])
    }
}



class С_SearchAndFiltersMasters: UIView {

    let searchTextField: W_Search = {
        let textField = W_Search()
        return textField
    }()

    let filterView1: W_Filter = {
        let filter = W_Filter(text: W_FilterStyles.Text.textInscriptionStyles)
        return filter
    }()

    let filterView2: W_Filter = {
        let filter = W_Filter(text: W_FilterStyles.Text.textInscriptionCities)
        return filter
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(searchTextField)
        addSubview(filterView1)
        addSubview(filterView2)

        // Constraints for searchTextField
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: A_TextFieldStyles.Sizes.height),
            searchTextField.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)  // Add this line
        ])


        // Constraints for filterView1
        filterView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView1.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filterView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterView1.widthAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.width),
            filterView1.heightAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.height)
        ])

        // Constraints for filterView2
        filterView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView2.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filterView2.leadingAnchor.constraint(equalTo: filterView1.trailingAnchor, constant: 20), // Horizontal spacing of 20
            filterView2.widthAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.width),
            filterView2.heightAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.height)
        ])
    }
}

class С_SearchAndFiltersTattoo: UIView {

    let searchTextField: W_Search = {
        let textField = W_Search()
        return textField
    }()

    let filterView1: W_Filter = {
        let filter = W_Filter(text: W_FilterStyles.Text.textInscriptionStyles)
        return filter
    }()

    let filterView2: W_Filter = {
        let filter = W_Filter(text: W_FilterStyles.Text.textInscriptionBody)
        return filter
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(searchTextField)
        addSubview(filterView1)
        addSubview(filterView2)

        // Constraints for searchTextField
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: topAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: A_TextFieldStyles.Sizes.height),
            searchTextField.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)  // Add this line
        ])


        // Constraints for filterView1
        filterView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView1.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filterView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterView1.widthAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.width),
            filterView1.heightAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.height)
        ])

        // Constraints for filterView2
        filterView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView2.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            filterView2.leadingAnchor.constraint(equalTo: filterView1.trailingAnchor, constant: 20), // Horizontal spacing of 20
            filterView2.widthAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.width),
            filterView2.heightAnchor.constraint(equalToConstant: W_FilterStyles.Sizes.height)
        ])
    }
}

class CustomContainerView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = A_MainTitleStyles.Color.textColorBlack
        label.font = A_MainTitleStyles.Font.textFont
        return label
    }()

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ])

        // Устанавливаем текст при инициализации
        titleText = A_MainTitleStyles.Text.textInscriptionMasters
    }
}

class C_BasicTitle: UIView {

    let blueContainerView: CustomContainerView = {
        let view = CustomContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let greenContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 20.0
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        // Добавляем зеленый блок на слой
        addSubview(greenContainerView)

        // Добавляем синий блок
        addSubview(blueContainerView)

        // Устанавливаем констрейнты для синего блока
        NSLayoutConstraint.activate([
            blueContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            blueContainerView.centerYAnchor.constraint(equalTo: topAnchor),
        ])

        // Устанавливаем констрейнты для зеленого блока
        NSLayoutConstraint.activate([
            greenContainerView.widthAnchor.constraint(equalToConstant: 350),
            greenContainerView.heightAnchor.constraint(equalToConstant: 70),
            greenContainerView.centerYAnchor.constraint(equalTo: blueContainerView.bottomAnchor)
        ])
    }
}

class CustomContainerWithBorderView: C_BasicTitle {

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            blueContainerView.titleText = A_MainTitleStyles.Text.textInscriptionMasters
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleText = A_MainTitleStyles.Text.textInscriptionMasters
    }
}

class C_TitleCategoryPageLibrary: C_BasicTitle {

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            blueContainerView.titleText = A_MainTitleStyles.Text.textInscriptionStyleLibrary
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleText = A_MainTitleStyles.Text.textInscriptionStyleLibrary
    }
}

class C_TitleCategoryPagePopular: C_BasicTitle {

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            blueContainerView.titleText = A_MainTitleStyles.Text.textInscriptionPopular
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleText = A_MainTitleStyles.Text.textInscriptionStyleLibrary
    }
}

class C_TitleCategoryPageAll: C_BasicTitle {

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            blueContainerView.titleText = A_MainTitleStyles.Text.textInscriptionAllCategories
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleText = A_MainTitleStyles.Text.textInscriptionStyleLibrary
    }
}

class C_TitleAllWorks: C_BasicTitle {

    // Добавим свойство для установки текста
    var titleText: String? {
        didSet {
            blueContainerView.titleText = A_MainTitleStyles.Text.textInscriptionAllWorks
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        titleText = A_MainTitleStyles.Text.textInscriptionAllWorks
    }
}

class BasicMasterCardData: UIView {
    
    // Большой текст
    let bigTextLabel: UILabel = {
        let label = UILabel()
        label.font = A_BigBodyTextStyles.Font.textFont
        label.textColor = A_BigBodyTextStyles.Color.textColorWhite
        label.text = "Your"
        return label
    }()
        
        // Надпись на карточке
    let cardTextLabel: UILabel = {
            let label = UILabel()
            label.font = A_BodyTextCardsStyles.Font.textFont
            label.textColor = A_BodyTextCardsStyles.Color.textColorWhite
            label.text = "Your Card Text Here"
            return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(bigTextLabel)
        addSubview(cardTextLabel)
        
        bigTextLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardTextLabel.topAnchor.constraint(equalTo: bigTextLabel.bottomAnchor, constant: -2)
        ])
    }
}

class W_MasterCardReviews: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "10"
            cardTextLabel.text = "отзывов"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}

class W_MasterCardRating: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "4.0"
            cardTextLabel.text = "рейтинг"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}

class W_MasterCardWorks: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "23"
            cardTextLabel.text = "тату"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}


// Temporary

class W_MasterCardReviews1: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "5"
            cardTextLabel.text = "отзывов"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}

class W_MasterCardRating1: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "4.3"
            cardTextLabel.text = "рейтинг"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}

class W_MasterCardWorks1: BasicMasterCardData {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
            
            // Пример изменения текста в наследуемом классе
            bigTextLabel.text = "13"
            cardTextLabel.text = "тату"
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupViews()
        }
        
        private func setupViews() {
            // Здесь может быть дополнительная настройка вида, если необходимо
        }
}
