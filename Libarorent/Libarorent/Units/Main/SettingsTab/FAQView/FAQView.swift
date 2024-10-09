//
//  FAQView.swift
//  Libarorent
//
//  Created by Andrii Momot on 09.10.2024.
//

import SwiftUI

struct FAQView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Colors.liteBlack.swiftUIColor
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                BackButton(title: "FAQ")
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 25) {
                        ForEach(viewModel.faqItems) { item in
                            FAQCell(model: item)
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    FAQView()
}
