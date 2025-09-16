//
//  NoteListRowView.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import SwiftUI

struct NoteListRowView: View {
    
    let note : Note
    
    var body: some View {
        
        HStack{
            Text(note.title)
                .font(.headline)
            
            Spacer()
            
            Text(note.date, style: .date)
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        
    }
}

#Preview {
    NoteListRowView(note: Note(title: "asd", content: "wdsas", date: Date()))
}
