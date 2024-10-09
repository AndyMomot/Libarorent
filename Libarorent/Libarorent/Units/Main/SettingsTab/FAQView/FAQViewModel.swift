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
            .init(title: "Question?",
                  text: "Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer"),
            .init(title: "Question?",
                  text: "Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer"),
            .init(title: "Question?",
                  text: "Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer"),
            .init(title: "Question?",
                  text: "Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer")
        ]
    }
}
