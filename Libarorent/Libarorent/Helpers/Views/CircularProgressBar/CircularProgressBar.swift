//
//  CircularProgressBar.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CircularProgressBar: View {
    var backgroundColor: Color = .black
    var lineWidth: CGFloat = 18
    var lineCap: CGLineCap = .butt
    var progressColors: Color = .red
    
    var textColor: Color = .blue
    var font = Fonts.KulimPark.bold.swiftUIFont(size: 35)
    
    var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke( // 1
                    backgroundColor,
                    lineWidth: lineWidth
                )
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke( // 1
                    progressColors,
                    style: .init(
                        lineWidth: lineWidth,
                        lineCap: lineCap
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            
            Text((progress * 100).string() + "%")
                .foregroundStyle(textColor)
                .font(font)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
        }
    }
}

#Preview {
    CircularProgressBar(progress: 0.2)
        .padding()
}
