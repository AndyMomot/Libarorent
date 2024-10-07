//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        @Published var showPrivacyPolicy = false
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var whiteTitle: String {
            switch self {
            case .first:
                return "Efektywne planowanie dzięki "
            case .second:
                return "Kontroluj swoje "
            case .third:
                return "Optymalizuj "
            }
        }
        
        var orangeTitle: String {
            switch self {
            case .first:
                return "analizie kosztów produkcji!"
            case .second:
                return "koszty z łatwością"
            case .third:
                return "wydatki i zwiększaj zyski!"
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return "Stworzony dla przedsiębiorców prowadzących dowolną formę firmy, a także osób prowadzących jednoosobową działalność gospodarczą i osób fizycznych."
            case .second:
                return "Podejmuj decyzje, które pozwolą zaoszczędzić pieniądze i zwiększyć zyski!"
            case .third:
                return "Oceń opłacalność inwestycji w swój biznes i wybierz najbardziej opłacalną dla Ciebie opcję! Projekty wynajmu pokażą Ci, jak wydatki wpływają na dochody!"
            }
        }
        
        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
    }
}
