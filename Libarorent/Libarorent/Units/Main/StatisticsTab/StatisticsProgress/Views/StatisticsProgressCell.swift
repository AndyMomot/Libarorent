//
//  StatisticsProgressCell.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct StatisticsProgressCell: View {
    var progressColors: Color
    var progress: Double
    
    var body: some View {
        ZStack {
            Colors.grayLite.swiftUIColor
                .opacity(0.7)
                .cornerRadius(40, corners: .allCorners)
            
            CircularProgressBar(
                backgroundColor: Colors.darkBlack.swiftUIColor,
                progressColors: progressColors,
                textColor: .white,
                progress: progress
            )
            .padding(24)
        }
    }
}

#Preview {
    StatisticsProgressCell(
        progressColors: .green,
        progress: 0.5
    )
        .frame(width: 359, height: 203)
}
