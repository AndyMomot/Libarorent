//
//  StatisticsProgressViewModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import Foundation

extension StatisticsProgressView {
    final class ViewModel: ObservableObject {
        @Published var profit: Double = 0
        @Published var costs: Double = 0
        
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
    }
}
