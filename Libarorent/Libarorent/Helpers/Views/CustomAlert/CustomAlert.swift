//
//  CustomAlert.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CustomAlert: View {
    var title: String
    var message: String
    var action: (Bool) -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .opacity(0.7)
            
            VStack(spacing: 0) {
                VStack(spacing: 12) {
                    HStack {
                        Spacer()
                        Text(title)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                        Spacer()
                    }
                    
                    Text(message)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                }
                .padding(30)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .background(Colors.darkBlack.swiftUIColor)
                .cornerRadius(10, corners: [.topLeft, .topRight])
                .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
                .padding(.horizontal)
                
                HStack {
                    NextButton(title: "Tak") {
                        action(true)
                    }
                    .frame(height: 44)
                    
                    Spacer(minLength: 44)
                    
                    NextButton(
                        title: "Nie",
                        bgColors: [
                            Colors.grayDark.swiftUIColor,
                            Colors.silver.swiftUIColor.opacity(0.9)
                        ]) {
                            action(false)
                        }
                        .frame(height: 44)
                }
                .padding(.horizontal, 40)
                .offset(y: -20)
            }
        }
    }
}

#Preview {
    CustomAlert(
        title: "Usuń",
        message: "Czy naprawdę chcesz go usunąć?") {_ in}
}
