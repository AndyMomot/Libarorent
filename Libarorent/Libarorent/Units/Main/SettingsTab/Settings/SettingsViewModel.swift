//
//  SettingsViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import Foundation

extension SettingsView {
    final class ViewModel: ObservableObject {
        let appStoreURL = URL(string: "https://www.apple.com")
        let supportURL = URL(string: "https://support.libarorent.info")
        
        @Published var showFAQ = false
        @Published var showSupport = false
    }
}
