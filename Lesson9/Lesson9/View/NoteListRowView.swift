//
//  NoteListRowView.swift
//  Lesson9
//
//  Created by Batuhan Gözegü on 19.09.2025.
//

import SwiftUI

struct NoteListRowView: View {
    
    let note: Note
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading ,spacing: 4){
                Text(note.title ?? "Başlıksız Not")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundStyle(.primary)
        
                Text(note.content ?? "")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }//vstack
            
            Spacer()
            
            VStack(alignment: .trailing ,spacing: 4){
                
                Text(note.date?.formatted(date:.abbreviated,time:.omitted) ?? "")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Text(note.date?.formatted(date:.omitted, time: .shortened) ?? "")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }//hstack
        .padding(.vertical ,2)
    }
}

