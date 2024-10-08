//
//  HomeViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import Foundation

extension HomeView {
    final class ViewModel: ObservableObject {
        @Published var categories = [CategoryModel]()
        @Published var showCategories = false
        
        lazy var categoryToShow: CategoryModel.Category? = nil
        
        func getCategories() {
            DispatchQueue.main.async { [weak self] in
                self?.categories = DefaultsService.categories.filter { $0.isLiked }
            }
        }
    }
}
