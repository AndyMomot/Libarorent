//
//  StatisticsProgressViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import Foundation
import UIKit.UIImage

extension StatisticsProgressView {
    final class ViewModel: ObservableObject {
        @Published var profit: Double = 0
        @Published var costs: Double = 0
        
        @Published var showAlert = false
        @Published var isShareSheetPresented = false
        @Published var screenshotImage: UIImage? = nil
        
        func getData() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                let items = DefaultsService.categories
                let budget = items.map { $0.budget }.reduce(0) {$0 + ($1 ?? 0)}
                let budgetAfter = items.map { $0.budgetAfter }.reduce(0) {$0 + $1}
                let costs = items.map { $0.cost }.reduce(0) {$0 + $1}
                
                guard budget > .zero else {
                    self.profit = .zero
                    self.costs = .zero
                    return
                }
                
                let profit = Double(budgetAfter) / Double(budget)
                let cost = Double(costs) / Double(budget)
                
                self.profit = profit
                self.costs = cost
            }
        }
        
        // Function to take the screenshot
        func takeScreenshot() -> UIImage? {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            
            if let window = window {
                let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
                let image = renderer.image { rendererContext in
                    window.layer.render(in: rendererContext.cgContext)
                }
                
               return image
            }
            return nil
        }
        
        // Function to take the screenshot and save it to the gallery
        func takeScreenshotAndSaveToGallery() {
            guard let image = takeScreenshot() else { return }
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            showAlert = true // Show an alert on success
        }
        
        // Function to take the screenshot and save it to the gallery
        func takeScreenshotAndShare() {
            guard let image = takeScreenshot() else { return }
            screenshotImage = image
            isShareSheetPresented = true
        }
    }
}
