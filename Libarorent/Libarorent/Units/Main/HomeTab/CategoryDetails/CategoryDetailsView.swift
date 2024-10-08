//
//  CategoryDetailsView.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CategoryDetailsView: View {
    
    @State var item: CategoryModel
    var onChanged: () -> Void
    
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State private var image: Image?
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.liteBlack.swiftUIColor
                .ignoresSafeArea()
            
            if let image {
                image
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .opacity(0.05)
            }
            
            VStack(spacing: 60) {
                BackButton(title: item.name)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            if let image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: bounds.width * 0.28,
                                           height: bounds.width * 0.22)
                                    .clipped()
                                    .cornerRadius(10, corners: .allCorners)
                            }
                            
                            VStack(alignment: .leading, spacing: 18) {
                                Text(item.name)
                                    .foregroundStyle(.white)
                                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                
                                Text("Ilość: ")
                                    .foregroundColor(.white)
                                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                                +
                                Text("\(item.quantity)")
                                    .foregroundColor(Colors.liteBlue.swiftUIColor)
                                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                            }
                            Spacer()
                        }
                        
                        Text(item.note)
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                        
                        VStack(spacing: 0) {
                            InputField(title: "Budżet",
                                       titleColor: .white,
                                       textColor: Colors.liteBlue.swiftUIColor,
                                       text: $viewModel.budget)
                            .keyboardType(.numberPad)
                            
                            InputField(title: "Cena za 1 ",
                                       titleColor: .white,
                                       textColor: Colors.liteBlue.swiftUIColor,
                                       text: $viewModel.pricePerItem)
                            .keyboardType(.numberPad)
                        }
                        .hideKeyboardWhenTappedAround()
                        
                        HStack(spacing: .zero) {
                            VStack(alignment: .leading, spacing: 26) {
                                Text("Budżet pozostaje")
                                Text("Koszt dla wszystkich")
                            }
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 15))
                            
                            Spacer(minLength: 30)
                            
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: 1)
                            
                            VStack {
                                Text("\(viewModel.budgetAfter)")
                                    .foregroundStyle(.white)
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(height: 1)
                                Text("\(viewModel.cost)")
                                    .foregroundStyle(Colors.liteOrange.swiftUIColor)
                            }
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                            .multilineTextAlignment(.center)
                        }
                        
                        HStack {
                            NextButton(title: "Komputery") {
                                viewModel.edit(item: item) {
                                    onChanged()
                                    dismiss.callAsFunction()
                                }
                            }
                            .frame(width: bounds.width * 0.4, height: 44)
                            .disabled(!viewModel.isValidFields)
                            .opacity(viewModel.isValidFields ? 1 : 0.5)
                            
                            Spacer()
                            
                            Button {
                                withAnimation {
                                    viewModel.showDeleteAlert.toggle()
                                }
                            } label: {
                                ZStack {
                                    LinearGradient(
                                        colors: [
                                            Colors.grayDark.swiftUIColor,
                                            Colors.silver.swiftUIColor.opacity(0.9)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing)
                                    
                                    Image(systemName: "trash")
                                        .foregroundStyle(.white)
                                }
                                .cornerRadius(22, corners: .allCorners)
                                .shadow(radius: 5, y: 5)
                                .frame(width: bounds.width * 0.2, height: 44)
                            }
                        }
                    }
                    .padding()
                    .background(Colors.silver.swiftUIColor.opacity(0.1))
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                    .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                }
                .scrollIndicators(.never)
            }
            .padding()
            
            if viewModel.showDeleteAlert {
                CustomAlert(
                    title: "Usuń",
                    message: "Czy naprawdę chcesz go usunąć?") { flag in
                        withAnimation {
                            viewModel.showDeleteAlert.toggle()
                        }
                        
                        if flag {
                            viewModel.delete(item: item) {
                                onChanged()
                                dismiss.callAsFunction()
                            }
                        }
                    }
            }
        }
        .onAppear {
            setImage()
            
            if let budget = item.budget {
                viewModel.budget = "\(budget)"
            }
            
            if let pricePerItem = item.pricePerItem {
                viewModel.pricePerItem = "\(pricePerItem)"
            }
        }
        .onChange(of: viewModel.budget) { newValue in
            item.budget = Int(newValue) ?? .zero
            viewModel.cost = item.cost
            viewModel.budgetAfter = item.budgetAfter
            viewModel.validateFields()
        }
        .onChange(of: viewModel.pricePerItem) { newValue in
            item.pricePerItem = Int(newValue) ?? .zero
            viewModel.cost = item.cost
            viewModel.budgetAfter = item.budgetAfter
            viewModel.validateFields()
        }
    }
}

private extension CategoryDetailsView {
    func setImage() {
        DispatchQueue.main.async {
            withAnimation {
                if let imageData = item.getImageData(),
                   let uiImage = UIImage(data: imageData) {
                    image = .init(uiImage: uiImage)
                } else {
                    image = Asset.placeholder.swiftUIImage
                }
            }
        }
    }
}

#Preview {
    CategoryDetailsView(item: .init(
        type: .phone,
        name: "Phone company",
        note: "Telefony odgrywają kluczową rolę w funkcjonowaniu firmy, zapewniając dostęp do istotnych informacji wewnętrznych i umożliwiając sprawną komunikację między pracownikami. Korzystanie z firmowych urządzeń pozwala na kontrolowanie przepływu danych, co gwarantuje bezpieczeństwo i zachowanie poufności.",
        quantity: 2)) {}
}
