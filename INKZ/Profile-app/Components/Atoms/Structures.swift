//
//  Structures.swift
//  INKZ
//
//  Created by Stanislava Shestakova on 26/12/2023.
//

import UIKit

struct A_MainTitleStyles {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 30.0) ?? UIFont.systemFont(ofSize: 30.0)
    }
    
    struct Color {
        static let textColorBlack = UIColor.black
    }
    
    struct Restriction {
        static let textMaxWidth: CGFloat = 330.0
    }
    
    // MARK: Структура текста временная, ждем когда будут готовы все данные для API
    
    struct Text {
        static let textInscriptionPopular = "Популярное"
        static let textInscriptionAllWorks = "Все работы"
        static let textInscriptionStyleLibrary = "Библиотека стилей"
        static let textInscriptionMasters = "Анкеты мастеров"
    }
    
}

struct A_MainTitleStylesEmpty {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 30.0) ?? UIFont.systemFont(ofSize: 30.0)
    }
    
    struct Color {
        static let textColorBlack = UIColor.black
    }
    
    struct Restriction {
        static let textMaxWidth: CGFloat = 330.0
    }
    
    struct Text {
        static let textInscriptionPopular = "Популярное"
        static let textInscriptionAllWorks = "Все работы"
        static let textInscriptionStyleLibrary = "Библиотека стилей"
    }
    
}

struct A_ButtonStyles {
    struct Colors {
        static let backgroundColor = UIColor.black
        static let textColor = UIColor.white
    }
    struct CornerRadius {
        static let cornerRadius: CGFloat = 10.0
    }
    struct Sizes {
        static let widthLong: CGFloat = 350.0
        static let widthShort: CGFloat = 310.0
        static let widthShortest: CGFloat = 150.0
        static let height: CGFloat = 50.0
        static let fontSize: CGFloat = 18.0
    }
    struct Color {
        static let textColorWhite = UIColor.white
        static let textColorBlack = UIColor.black
    }
}

struct A_CardsTitleStyles {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 25.0) ?? UIFont.systemFont(ofSize: 25.0)
    }
    
    struct Color {
        static let textColorWhite = UIColor.white
    }
    
    struct Restriction {
        static let textMaxWidth: CGFloat = 290.0
    }
    
    // MARK: Структура текста временная, жду когда будут готовы все данные для API
    
    struct Text {
        static let textInscriptionFirstPopularCard = "Череп с глазками"
        static let textInscriptionSecondPopularCard = "Мумий Тролль"
        static let textInscriptionThirdPopularCard = "Танец"
        
        static let textInscription = "Test" // API
    }
}

struct A_CardsBodyTextStyles {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 20.0) ?? UIFont.systemFont(ofSize: 20.0)
    }
    
    struct Color {
        static let textColorWhite = UIColor.white
    }
    
    struct Restriction {
        static let textMaxWidth: CGFloat = 290.0
    }
    
    // MARK: Структура текста временная, жду когда будут готовы все данные для API
    
    struct Text {
        static let textInscriptionFirstPopularCard = "lunarwhisper"
        static let textInscriptionSecondPopularCard = "azureflame"
        static let textInscriptionThirdPopularCard = "silentspectre"
        
        static let textInscription = "test" // API
    }
    
}

struct A_BigBodyTextStyles {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 30.0) ?? UIFont.systemFont(ofSize: 30.0)
    }
    
    struct Color {
        static let textColorWhite = UIColor.white
        static let textColorBlack = UIColor.black
    }
    
    // MARK: Структура текста временная, жду когда будут готовы все данные для API
    
    struct Text {
        static let textInscription = "test" // API
    }
    
}

struct A_BodyTextStyles {
    
    struct Font {
        static let textFont = UIFont(name: "SuisseRegular", size: 18.0) ?? UIFont.systemFont(ofSize: 18.0)
    }
    
    struct Color {
        static let textColorWhite = UIColor.white
        static let textColorBlack = UIColor.black
    }
    
    // MARK: Структура текста временная, жду когда будут готовы все данные для API
    
    struct Text {
        static let textInscription = "test" // API
        static let textArticle1 = "Как не пожалеть о первой тату?"
        static let textArticle2 = "Быстрый гайд по тату-стилям" 
    }
    
}

struct A_TextFieldStyles {
    struct Colors {
        static let backgroundColor = UIColor.white
        static let textColor = UIColor.black
        static let borderColor = UIColor.black
    }
    struct CornerRadius {
        static let cornerRadius: CGFloat = 10.0
    }
    struct Sizes {
        static let width: CGFloat = 350.0
        static let height: CGFloat = 50.0
        static let fontSize: CGFloat = 18.0
        static let horizontalPadding: CGFloat = 15.0
    }
}

struct W_FilterStyles {
    struct Colors {
        static let backgroundColor = UIColor.white
        static let textColor = UIColor.black
        static let borderColor = UIColor.black
    }
    struct CornerRadius {
        static let cornerRadius: CGFloat = 10.0
    }
    struct Sizes {
        static let width: CGFloat = 166.0
        static let height: CGFloat = 50.0
        static let fontSize: CGFloat = 18.0
        static let horizontalPadding: CGFloat = 15.0
    }
    struct Text {
        static let textInscriptionStyles = "Стили"
        static let textInscriptionCities = "Города"
    }
}

struct C_FiltersStyles {
    struct Margins {
        static let topMargin: CGFloat = 20.0
        static let horizontalSpacing: CGFloat = 20.0
    }
}
