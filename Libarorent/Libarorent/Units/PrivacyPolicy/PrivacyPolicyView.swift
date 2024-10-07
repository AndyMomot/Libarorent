//
//  PrivacyPolicyView.swift
//  Chainestery
//
//  Created by Andrii Momot on 17.08.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    
    @StateObject private var viewModel = PrivacyPolicyViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.darkBlue.swiftUIColor
                .ignoresSafeArea()
            
            Asset.preloadBgImage.swiftUIImage
                .resizable()
                .opacity(0.1)
            
            VStack {
                Text("Polityka prywatności")
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 40))
                    .multilineTextAlignment(.center)
                
                Asset.preloadLock.swiftUIImage
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 4) {
                    Button {
                        viewModel.showPrivacyPolicy.toggle()
                    } label: {
                        Text("Zapoznałem się z polityką prywatności")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                            .multilineTextAlignment(.center)
                    }
                    
                    Button {
                        withAnimation {
                            viewModel.isAgreed.toggle()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.white)
                            .scaledToFit()
                            .overlay {
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Colors.liteBlue.swiftUIColor, lineWidth: 1)
                            }
                            .overlay {
                                if viewModel.isAgreed {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Colors.liteBlue.swiftUIColor)
                                }
                            }
                            .frame(width: 26)
                            .padding(8)
                    }
                    
                    Button {
                        withAnimation {
                            viewModel.showMainFlow(rootViewModel: rootViewModel)
                        }
                    } label: {
                        Asset.preloadStart.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.65)
                    }
                    .disabled(!viewModel.isAgreed)
                    .opacity(viewModel.isAgreed ? 1 : 0.5)
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
