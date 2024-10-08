//
//  CategoryDetailsViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import Foundation

extension CategoryDetailsView {
    final class ViewModel: ObservableObject {
        
        @Published var budget = ""
        @Published var pricePerItem = ""
        
        @Published var cost = 0
        @Published var budgetAfter = 0
        
        @Published var isValidFields = false
        @Published var showDeleteAlert = false
        
        func validateFields() {
            isValidFields = (Int(budget) ?? .zero) > .zero && (Int(pricePerItem) ?? .zero) > .zero
        }
        
        func edit(item: CategoryModel, completion: @escaping () -> Void) {
            guard isValidFields else { return }
            DispatchQueue.main.async {
                if let index = DefaultsService.categories.firstIndex(where: { $0.id == item.id }) {
                    DefaultsService.categories[index] = item
                    completion()
                }
            }
        }
        
        func delete(item: CategoryModel, completion: @escaping () -> Void) {
            DispatchQueue.main.async {
                if let index = DefaultsService.categories.firstIndex(where: { $0.id == item.id }) {
                    DefaultsService.categories.remove(at: index)
                    completion()
                }
            }
        }
    }
}
