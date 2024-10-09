//
//  FAQCell.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import SwiftUI

struct FAQCell: View {
    var model: FAQModel
    
    @State var showAnswer = false
    
    var body: some View {
        Button {
            withAnimation {
                showAnswer.toggle()
            }
        } label: {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(model.title)
                        Spacer()
                        Image(systemName: showAnswer ? "chevron.up" : "chevron.down")
                    }
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                    
                    if showAnswer {
                        Text(model.text)
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 25))
                    }
                }
                .multilineTextAlignment(.leading)
                .padding()
                .background {
                    LinearGradient(
                        colors: [
                            Colors.liteBlue.swiftUIColor,
                            Colors.darkBlue.swiftUIColor.opacity(0.9)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .cornerRadius(22, corners: .allCorners)
                }
        }

    }
}

#Preview {
    FAQCell(model: .init(title: "Question?", 
                         text: "Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer"))
}
