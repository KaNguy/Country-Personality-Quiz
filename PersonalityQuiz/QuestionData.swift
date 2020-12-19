//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by KaNguy on 12/12/20.
//

import Foundation

struct Question {
    var text: String, type: ResponseType, answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String, type: CountryType
}

enum CountryType: Character {
    case US = "🇺🇸", TW = "🇹🇼", JP = "🇯🇵", KO = "🇰🇷"
    
    var definition: String {
        switch self {
        case .US:
            return "You are incredibly strong and righteous of justice, you are prosperous and would be a great entrepreneur. Furthermore, you are able to build strong, valuable, and long-lasting friendships with others."
        case .TW:
            return "You are peaceful and very good at negotiating, you are able to get along with others and will go very far in life."
        case .JP:
            return "You are very caring about your cleanliness and very polite. You are organized and keep things clean, free of clutter. Additionally, you are very healthy and stay fit."
        case .KO:
            return "You are exceptionally prepared mentally and / or physically, you are ready to take on whatever life has to offer. You try to stay secure and you are very careful."
        }
    }
    
    func displayImage() -> String {
        switch self {
            case .US:
                return "US.png"
            case .TW:
                return "TW.png"
            case .JP:
                return "JP.png"
            case .KO:
                return "KO.png"
        }
    }
}
