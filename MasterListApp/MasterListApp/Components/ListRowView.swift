//
//  ListRowView.swift
//  MasterListApp
//
//  Created by Batuhan Gözegü on 3.09.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let list: ListItem
    var toggleDone: () -> Void
    var theme:Color
    
    var body: some View {
        HStack{
            Button(action: toggleDone) {
                Image(systemName: list.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)
            Text(list.title)
                .strikethrough(list.isCompleted,color: Color(.black))
                .foregroundStyle(list.isCompleted ? .black : .red)
                Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(theme.opacity(0.8))   // 0.5–0.6 tatlı durur
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black.opacity(0.08), lineWidth: 1)
        )
        .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
        
    }
}
