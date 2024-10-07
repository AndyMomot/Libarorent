//
//  OnboardingView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Colors.darkBlue.swiftUIColor
                .ignoresSafeArea()
            
            Asset.preloadBgImage.swiftUIImage
                .resizable()
                .opacity(0.1)
            
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                Text(item.whiteTitle)
                    .foregroundColor(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 40))
                    +
                Text(item.orangeTitle)
                    .foregroundColor(Colors.liteOrange.swiftUIColor)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 40))
                
                Text(item.text)
                    .foregroundColor(.white)
                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            currentPageIndex = item.next.rawValue
                        }
                        
                        if item == .third {
                            viewModel.showPrivacyPolicy.toggle()
                        }
                    } label: {
                        Asset.onboardNext.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.65)
                    }
                    Spacer()
                }

            }
            .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $viewModel.showPrivacyPolicy) {
            PrivacyPolicyView()
        }
    }
}

#Preview {
    OnboardingView(item: .first, currentPageIndex: .constant(0))
}
