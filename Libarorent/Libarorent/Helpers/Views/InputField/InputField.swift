////
////  InputField.swift
////  Tradifundint
////
////  Created by Andrii Momot on 08.07.2024.
////
//
import SwiftUI

struct InputField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.white)
            
            TextField(text: $text) {
                Text("wprowadź informacje")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
            .background(.white)
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

extension InputField {
    enum Style {
        case text
        case date
    }
}

#Preview {
    ZStack {
        InputField(title: "Imię Nazwisko", text: .constant(""))
            .padding(.horizontal)
    }
}
