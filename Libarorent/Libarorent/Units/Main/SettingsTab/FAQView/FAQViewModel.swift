//
//  FAQViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import Foundation

extension FAQView {
    final class ViewModel: ObservableObject {
        let faqItems: [FAQModel] = [
            .init(title: "1. Jakie funkcje oferuje aplikacja?",
                  text: "Aplikacja umożliwia śledzenie i tworzenie projektów wynajmu i zakupu sprzętu. Dzięki niemu możesz porównać różne opcje, aby wybrać najlepsze rozwiązanie dla siebie lub swojej firmy."),
            .init(title: "2. Dla kogo przeznaczona jest aplikacja?",
                  text: "Aplikacja przeznaczona jest dla firm dowolnej wielkości, przedsiębiorców indywidualnych oraz osób fizycznych, które chcą przeanalizować koszty związane z wynajmem lub zakupem sprzętu."),
            .init(title: "3. Jak działa funkcja wypożyczenia projektu?",
                  text: "Projekty wynajmu pozwalają użytkownikowi obliczyć, ile zarobi, biorąc pod uwagę koszty wypożyczenia sprzętu. Dzięki temu można ocenić, czy wynajem jest lepszym rozwiązaniem niż zakup."),
            .init(title: "4. Jak działa funkcja zakupów projektowych?",
                  text: "Projekty zamówień pokazują, ile czasu zajmie zwrot inwestycji w zakup sprzętu. Aplikacja analizuje Twoje koszty zakupu i pomaga obliczyć okres, w którym koszty te zostaną pokryte zyskami."),
            .init(title: "5. Czy mogę porównać projekty wynajmu i zakupu?",
                  text: "Tak, aplikacja umożliwia porównanie różnych projektów wynajmu i zakupu, aby pomóc użytkownikowi podjąć najbardziej opłacalną decyzję."),
            .init(title: "6. Czy aplikacja pomaga Ci kontrolować budżet?", 
                  text: "Z pewnością! Aplikacja pozwala na śledzenie wszelkich wydatków związanych z wypożyczeniem lub zakupem sprzętu oraz zarządzanie budżetem w czasie rzeczywistym."),
            .init(title: "7. Czy aplikacja obsługuje różne waluty?", 
                  text: "Tak, aplikacja umożliwia pracę z wieloma walutami, co jest szczególnie przydatne dla użytkowników prowadzących biznes międzynarodowy."),
            .init(title: "8. Czy mogę wyeksportować dane z aplikacji?",
                  text: "Tak, aplikacja posiada funkcję eksportu danych do formatu PDF lub Excel, co ułatwia dalszą analizę i prezentację wyników."),
            .init(title: "9. Czy aplikacja jest odpowiednia dla małych firm?",
                  text: "Tak, aplikacja ma być przydatna zarówno dla małych firm, jak i dużych korporacji.")
        ]
    }
}
