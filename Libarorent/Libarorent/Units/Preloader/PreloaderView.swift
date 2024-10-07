//
//  PreloaderView.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import SwiftUI

struct PreloaderView: View {
    
    @StateObject private var viewModel = PreloaderViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .scaledToFit()
                .overlay {
                    VStack(spacing: 10) {
                        Spacer()
                        Asset.whiteLogo.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .frame(width: bounds.width * 0.45)
                        
                        Text("Libarorent")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 34))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                    }
                    .padding(.bottom)
                }
            
            Asset.whiteLogo.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: bounds.width)
                .opacity(0.05)
                .overlay {
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Color.white
                                .cornerRadius(7, corners: .allCorners)
                            
                            ProgressView(value: viewModel.progress, total: 1)
                                .padding(.horizontal, 6)
                        }
                        .frame(width: bounds.width * 0.8, height: 10)
                        
                        VStack(spacing: 10) {
                            Text("Ładowanie")
                                .foregroundStyle(.white)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                    }
                }
        }
        .background(Colors.darkBlue.swiftUIColor)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                withAnimation {
                    viewModel.startLoading()
                }
            }
        }
    }
}

#Preview {
    PreloaderView()
}
