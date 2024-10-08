//
//  CreateCategoryViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import Foundation
import UIKit.UIImage

extension CreateCategoryView {
    final class ViewModel: ObservableObject {
        @Published var image = UIImage()
        @Published var showImagePicker = false
        
        @Published var name = ""
        @Published var note = ""
        @Published var quantity = 0
        
        @Published var isValidFields = false
        
        func validateFields() {
            isValidFields = image != UIImage() &&
            !name.isEmpty && !note.isEmpty && quantity > .zero
        }
        
        func saveCategory(with type: CategoryModel.Category, 
                          completion: @escaping () -> Void) {
            guard isValidFields else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                let model = CategoryModel(
                    type: type,
                    name: self.name,
                    note: self.note,
                    quantity: self.quantity
                )
                
                DefaultsService.categories.append(model)
                
                if let data = self.image.jpegData(compressionQuality: 1) {
                    model.saveImage(data: data)
                }
                
                completion()
            }
        }
    }
}
