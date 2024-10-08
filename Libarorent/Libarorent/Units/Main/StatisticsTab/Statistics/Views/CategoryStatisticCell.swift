//
//  CategoryStatisticCell.swift
//  Libarorent
//
//  Created by Andrii Momot on 08.10.2024.
//

import SwiftUI

struct CategoryStatisticCell: View {
    var imageName: String
    var name: String
    var profit: Double
    var costs: Double
    
    var body: some View {
        ZStack {
            Colors.darkBlue.swiftUIColor
                .cornerRadius(10, corners: .allCorners)
            
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Colors.liteBlue.swiftUIColor)
                    .overlay {
                        VStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                            
                            HStack {
                                Text(name)
                                    .foregroundStyle(.white)
                                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                Spacer()
                            }
                        }
                        .padding(12)
                    }
                    .shadow(radius: 5, y: 5)
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text("Zysk")
                            Spacer()
                            Text((profit*100).string() + "%")
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 10))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        
                        LinearProgressBar(
                            backgroundColor: .black,
                            progressColor: .green,
                            progress: profit
                        )
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text("Koszty")
                            Spacer()
                            Text((costs*100).string() + "%")
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 10))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        
                        LinearProgressBar(
                            backgroundColor: .black,
                            progressColor: .red,
                            progress: costs
                        )
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 14)
            }
        }
    }
}

#Preview {
    CategoryStatisticCell(
        imageName: Asset.phone.name,
        name: "Telefony",
        profit: 0.3,
        costs: 0.7
    )
    .frame(width: 148, height: 264)
}
