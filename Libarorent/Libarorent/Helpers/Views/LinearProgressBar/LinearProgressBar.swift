//
//  LinearProgressBar.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct LinearProgressBar: View {
    var backgroundColor: Color = .black
    var progressColor: Color = .red
    var cornerRadius: CGFloat = 10
    var height: CGFloat = 10
    
    var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, 
                           height: height)
                    .foregroundColor(backgroundColor)
                    .cornerRadius(cornerRadius, corners: .allCorners)
                
                Rectangle()
                    .frame(
                        width: min(progress * geometry.size.width,
                                   geometry.size.width),
                        height: height
                    )
                    .foregroundColor(progressColor)
                    .cornerRadius(cornerRadius, corners: .allCorners)
                    .animation(.easeOut, value: progress)
            }
        }
    }
}

#Preview {
    LinearProgressBar(progress: 0.2)
        .frame(width: 200, height: 20)
        .padding(.horizontal)
}
