//
//  RootContentView.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import SwiftUI

struct RootContentView: View {
    @StateObject private var viewModel = RootContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.showPreloader {
                Text("PreloaderView")
            } else {
                switch viewModel.viewState {
                case .onboarding:
                    Text("OnboardingViewTabView")
                        .environmentObject(viewModel)
                case .main:
                    Text("TabBar()")
                        .environmentObject(viewModel)
                }
            }
        }
        .onAppear {
            withAnimation {
                self.viewModel.getFlow()
            }
        }
    }
}

#Preview {
    RootContentView()
}
