//
//  StatisticsProgressView.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct StatisticsProgressView: View {
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.statisticsBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                BackButton(title: "Przychody ogółem")
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 35) {
                        StatisticsProgressCell(
                            progressColors: .green, 
                            progress: viewModel.profit
                        )
                        .frame(height: bounds.height * 0.25)
                        
                        StatisticsProgressCell(
                            progressColors: .red,
                            progress: viewModel.costs
                        )
                        .frame(height: bounds.height * 0.25)
                    }
                    .padding(.horizontal, 32)
                }
                .scrollIndicators(.never)
            }
        }
        .onAppear {
            withAnimation {
                viewModel.getData()
            }
        }
    }
}

#Preview {
    StatisticsProgressView()
}
