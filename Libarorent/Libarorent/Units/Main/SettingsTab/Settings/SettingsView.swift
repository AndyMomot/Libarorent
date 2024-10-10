//
//  SettingsView.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.liteBlack.swiftUIColor
                    .ignoresSafeArea()
                
                VStack(spacing: 37) {
                    HStack {
                        Text("Ustawienia")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                        Spacer()
                    }
                    .padding(.horizontal, 36)
                    
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 3)
                        .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 27) {
                            SettingsButton(imageName: Asset.update.name, title: "Aktualizacja") {
                                onUpdateApp()
                            }
                            .frame(height: 44)
                            
                            SettingsButton(imageName: Asset.info.name, title: "FAQ") {
                                viewModel.showFAQ.toggle()
                            }
                            .frame(height: 44)
                            
                            SettingsButton(imageName: Asset.support.name, title: "Wsparcie") {
                                viewModel.showSupport.toggle()
                            }
                            .frame(height: 44)
                        }
                        .padding(.horizontal, 40)
                    }
                    .scrollIndicators(.never)
                }
            }
            .sheet(isPresented: $viewModel.showSupport) {
                SwiftUIViewWebView(url: viewModel.supportURL)
            }
            .navigationDestination(isPresented: $viewModel.showFAQ) {
                FAQView()
            }
        }
    }
}

private extension SettingsView {
    func onUpdateApp() {
        guard let url = viewModel.appStoreURL,
              UIApplication.shared.canOpenURL(url)
        else { return }
        
        DispatchQueue.main.async {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}
