//
//  TodoTextField.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 3.09.2025.
//

import SwiftUI

struct ListTextField: View {
    
    @Binding var text : String
    var placeholder : String
    
    var body: some View {
        
        TextField(placeholder, text: $text)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(style: StrokeStyle(lineWidth: 1))
            )
    }
}
