//
//  StatisticsViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import Foundation

extension StatisticsView {
    final class ViewModel: ObservableObject {
        @Published var phoneProfit: Double = 0
        @Published var phoneCosts: Double = 0
        
        @Published var computerProfit: Double = 0
        @Published var computerCosts: Double = 0
        
        @Published var accessoriesProfit: Double = 0
        @Published var accessoriesCosts: Double = 0
        
        @Published var otherProfit: Double = 0
        @Published var otherCosts: Double = 0
        
        @Published var showProgress = false
        
        func setData() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                let categories = DefaultsService.categories
                
                let phoneCategories = categories.filter { $0.type == .phone }
                let phoneData = self.getData(items: phoneCategories)
                self.phoneProfit = phoneData.0
                self.phoneCosts = phoneData.1
                
                let computerCategories = categories.filter { $0.type == .computer }
                let computerData = self.getData(items: computerCategories)
                self.computerProfit = computerData.0
                self.computerCosts = computerData.1
                
                let accessoriesCategories = categories.filter { $0.type == .accessories }
                let accessoriesData = self.getData(items: accessoriesCategories)
                self.accessoriesProfit = accessoriesData.0
                self.accessoriesCosts = accessoriesData.1
                
                let otherCategories = categories.filter { $0.type == .other }
                let otherData = self.getData(items: otherCategories)
                self.otherProfit = otherData.0
                self.otherCosts = otherData.1
            }
        }
        
        private func getData(items: [CategoryModel]) -> (Double, Double) {
            let budget = items.map { $0.budget }.reduce(0) {$0 + ($1 ?? 0)}
            let budgetAfter = items.map { $0.budgetAfter }.reduce(0) {$0 + $1}
            let costs = items.map { $0.cost }.reduce(0) {$0 + $1}
            
            guard budget > .zero else { return (.zero, .zero) }
            
            let profit = Double(budgetAfter) / Double(budget)
            let cost = Double(costs) / Double(budget)
            
            return (profit, cost)
        }
    }
}
