//
//  CategoryCell.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CategoryCell: View {
    var item: CategoryModel
    
    @State private var image: Image?
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        HStack(spacing: 6) {
            if let image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: bounds.width * 0.28,
                           height: bounds.width * 0.22)
                    .clipped()
                    .cornerRadius(10, corners: .allCorners)
                    .padding(8)
            }
            
            VStack(alignment: .leading) {
                Spacer()
                Text(item.name)
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                Spacer()
                Text("Ilość: ")
                    .foregroundColor(.white)
                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                +
                Text("\(item.quantity)")
                    .foregroundColor(Colors.liteOrange.swiftUIColor)
                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                Spacer()
                Text("Koszt: ")
                    .foregroundColor(.white)
                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                +
                Text("\(item.cost)")
                    .foregroundColor(Colors.liteOrange.swiftUIColor)
                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                Spacer()
                    
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                LikeButton(isLiked: item.isLiked) { isLiked in
                    updateIsLike(status: isLiked)
                }
                .frame(width: bounds.width * 0.12,
                       height: bounds.width * 0.096)
                
                Spacer()
                
                ZStack {
                    ZStack {
                        LinearGradient(
                            colors: [
                                Colors.liteBlue.swiftUIColor,
                                Colors.darkBlue.swiftUIColor.opacity(0.9)
                            ],
                            startPoint: .top,
                            endPoint: .bottom)
                        
                        Text("Prasa")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                            .padding(.horizontal, 8)
                        
                    }
                    .cornerRadius(10, corners: [.topLeft, .bottomLeft, .bottomRight])
                }
                .frame(width: bounds.width * 0.222,
                       height: bounds.width * 0.1)
            }
        }
        .background(Colors.grayDark.swiftUIColor)
        .cornerRadius(10, corners: .allCorners)
        .onAppear {
            setImage()
        }
    }
}

private extension CategoryCell {
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
    
    func updateIsLike(status: Bool) {
        DispatchQueue.main.async {
            if let index = DefaultsService.categories.firstIndex(where: { $0.id == item.id }) {
                DefaultsService.categories[index].isLiked = status
            }
        }
    }
}

#Preview {
    ZStack {
        Colors.liteBlack.swiftUIColor
        
        CategoryCell(item: .init(
            type: .phone,
            name: "Phone company",
            note: "Telefony odgrywają kluczową rolę w funkcjonowaniu firmy, zapewniając dostęp do istotnych informacji wewnętrznych i umożliwiając sprawną komunikację między pracownikami. Korzystanie z firmowych urządzeń pozwala na kontrolowanie przepływu danych, co gwarantuje bezpieczeństwo i zachowanie poufności.",
        quantity: 2))
        .frame(height: 109)
    }
}
