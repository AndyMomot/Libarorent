//
//  StepperView.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct StepperView: View {
    @Binding var value: Int
    var step = 1
    var allowNegative = false
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 5) {
                Text("Ilość")
                    .foregroundStyle(.black)
                    .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 15))
                    .multilineTextAlignment(.center)
                
                ZStack {
                    Color.white
                        .frame(width: UIScreen.main.bounds.width * 0.27,
                               height: 49)
                        .cornerRadius(20, corners: .allCorners)
                    
                    Text("\(value)")
                        .foregroundStyle(.black)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 25))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer()
            
            HStack(spacing: 32) {
                
                Button {
                    withAnimation {
                        if !allowNegative && value - step < .zero {
                            value = .zero
                        } else {
                            value -= step
                        }
                    }
                    
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 30)
                        .padding(4)
                }
                
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(width: 3)
                
                Button {
                    withAnimation {
                        value += step
                    }
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame(width: 30)
                        .padding(4)
                }
                
            }
        }
    }
}

#Preview {
    ZStack {
        Colors.silver.swiftUIColor
        StepperView(value: .constant(1001))
            .padding(.horizontal)
            .frame(height: 76)
    }
}
