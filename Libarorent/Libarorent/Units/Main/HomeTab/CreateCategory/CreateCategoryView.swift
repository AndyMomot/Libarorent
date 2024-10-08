//
//  CreateCategoryView.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import SwiftUI

struct CreateCategoryView: View {
    var category: CategoryModel.Category
    var onSave: () -> Void
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) private var dismiss
    
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
                        
                        VStack(spacing: 4) {
                            // Name
                            InputField(
                                title: "Nazwa towaru",
                                text: $viewModel.name)
                            
                            // Note
                            DynamicHeightTextField(
                                title: "Do czego służy",
                                text: $viewModel.note)
                            .frame(minHeight: 110)
                            
                            // Quantity
                            StepperView(value: $viewModel.quantity)
                        }
                        
                        VStack(spacing: 8) {
                            Text("Utwórz produkt, który będzie wyświetlany w menu tej kategorii.")
                                .foregroundStyle(.black)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                            Rectangle()
                                .foregroundStyle(Colors.liteBlack.swiftUIColor)
                                .frame(height: 2)
                        }
                        
                        NextButton(title: "Komputery") {
                            viewModel.saveCategory(with: category) {
                                onSave()
                                dismiss.callAsFunction()
                            }
                        }
                        .frame(width: bounds.width * 0.4,
                               height: 44)
                        .disabled(!viewModel.isValidFields)
                        .opacity(viewModel.isValidFields ? 1 : 0.5)
                    }
                    .padding(.bottom)
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
        .onChange(of: viewModel.image) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.name) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.note) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.quantity) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
    }
}

#Preview {
    CreateCategoryView(category: .phone) {}
}
