//
//  CreateCategoryView.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct CreateCategoryView: View {
    @StateObject private var viewModel = ViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.liteBlack.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                BackButton(title: "Dodaj nowy Komputery")
                    .padding(.horizontal)
                
                
                ScrollView {
                    VStack(spacing: 34) {
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.showImagePicker.toggle()
                            } label: {
                                if viewModel.image == UIImage() {
                                    Asset.placeholder.swiftUIImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: bounds.width * 0.4)
                                        .shadow(radius: 10)
                                } else {
                                    Image(uiImage: viewModel.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: bounds.width * 0.4,
                                               height: bounds.width * 0.4)
                                        .clipped()
                                        .cornerRadius(10, corners: .allCorners)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 44)
                        
                        // Name
                        VStack(spacing: 4) {
                            InputField(
                                title: "Nazwa towaru",
                                text: $viewModel.name)
                            
                            DynamicHeightTextField(
                                title: "Do czego służy",
                                text: $viewModel.note)
                            .frame(minHeight: 110)
                        }
                        
                    }
                }
                .scrollIndicators(.never)
                .padding(.horizontal, 44)
                .background(Colors.silver.swiftUIColor)
                .cornerRadius(40, corners: .allCorners)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
    }
}

#Preview {
    CreateCategoryView()
}
