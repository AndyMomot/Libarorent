//
//  CategoryListViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import Foundation

extension CategoryListView {
    final class ViewModel: ObservableObject {
        
        @Published var categories = [CategoryModel]()
        @Published var showCreateCategory = false
        
        @Published var showCategory = false
        var categoryToShow: CategoryModel?
        
        func getCategories(category: CategoryModel.Category) {
            DispatchQueue.main.async { [weak self] in
                self?.categories = DefaultsService.categories.filter {
                    $0.type == category
                }
            }
        }
    }
}
