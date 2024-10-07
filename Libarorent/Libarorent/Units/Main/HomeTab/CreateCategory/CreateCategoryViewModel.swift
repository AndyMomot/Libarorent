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
    }
}
