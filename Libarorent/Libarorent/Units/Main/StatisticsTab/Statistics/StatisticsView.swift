//
//  StatisticsView.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.liteBlack.swiftUIColor
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Analiza produktu")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            HStack {
                                CategoryStatisticCell(
                                    imageName: Asset.phone.name,
                                    name: "Telefony",
                                    profit: viewModel.phoneProfit,
                                    costs: viewModel.phoneCosts
                                )
                                .frame(
                                    width: bounds.width * 0.349,
                                    height: bounds.height * 0.285
                                )
                                
                                Spacer()
                                
                                CategoryStatisticCell(
                                    imageName: Asset.computer.name,
                                    name: "Komputery",
                                    profit: viewModel.computerProfit,
                                    costs: viewModel.computerCosts
                                )
                                .frame(
                                    width: bounds.width * 0.349,
                                    height: bounds.height * 0.285
                                )
                            }
                            
                            HStack {
                                CategoryStatisticCell(
                                    imageName: Asset.accessories.name,
                                    name: "Akcesoria",
                                    profit: viewModel.accessoriesProfit,
                                    costs: viewModel.accessoriesCosts
                                )
                                .frame(
                                    width: bounds.width * 0.349,
                                    height: bounds.height * 0.285
                                )
                                
                                Spacer()
                                
                                CategoryStatisticCell(
                                    imageName: Asset.other.name,
                                    name: "Utwórz",
                                    profit: viewModel.otherProfit,
                                    costs: viewModel.otherCosts
                                )
                                .frame(
                                    width: bounds.width * 0.349,
                                    height: bounds.height * 0.285
                                )
                            }
                            
                            NextButton(title: "Przychody ogółem") {
                                viewModel.showProgress.toggle()
                            }
                            .frame(height: 44)
                        }
                        .padding(.horizontal, 40)
                    }
                    .scrollIndicators(.never)
                }
            }
            .onAppear {
                withAnimation {
                    viewModel.setData()
                }
            }
            .navigationDestination(isPresented: $viewModel.showProgress) {
                StatisticsProgressView()
            }
        }
    }
}

#Preview {
    StatisticsView()
}
