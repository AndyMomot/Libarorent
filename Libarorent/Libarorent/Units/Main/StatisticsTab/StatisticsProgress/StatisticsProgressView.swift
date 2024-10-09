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
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.takeScreenshotAndSaveToGallery()
                            } label: {
                                Asset.save.swiftUIImage
                            }
                            
                            Spacer()
                            
                            Button {
                                viewModel.takeScreenshotAndShare()
                            } label: {
                                Asset.share.swiftUIImage
                            }
                            
                            Spacer()
                        }
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
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Sukces!"),
                  message: Text("Zrzut ekranu zapisany w Twojej galerii zdjęć"),
                  dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $viewModel.isShareSheetPresented, onDismiss: {
            viewModel.screenshotImage = nil // Clear image after sharing
        }) {
            if let screenshotImage = viewModel.screenshotImage {
                ShareSheet(activityItems: [screenshotImage])
            }
        }
    }
}

#Preview {
    StatisticsProgressView()
}
