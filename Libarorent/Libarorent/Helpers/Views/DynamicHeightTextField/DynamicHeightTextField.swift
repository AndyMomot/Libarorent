//
//  DynamicHeightTextField.swift
//  Chainestery
//
//  Created by Andrii Momot on 21.08.2024.
//

import SwiftUI

struct DynamicHeightTextField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.white)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                
                TextEditor(text: $text)
                    .padding()
                
                
                if text.isEmpty {
                    Text("wprowadź informacje")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 26)
                        .allowsHitTesting(false)
                }
            }
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

#Preview {
    ZStack {
        DynamicHeightTextField(
            title: "Uwaga do projektu",
            text: .constant(""))
        .frame(maxHeight: 117)
        .padding()
    }
}
