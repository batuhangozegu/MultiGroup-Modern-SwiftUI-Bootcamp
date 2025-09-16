//
//  DetailView.swift
//  Lesson8
//
//  Created by Batuhan Gözegü on 16.09.2025.
//

import SwiftUI

struct DetailView: View {
    let note : Note
    @ObservedObject var vm : NoteViewModel
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text(note.title)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Text(note.content)
                .font(.title2.weight(.medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Text(note.date.formatted(date: .long, time: .shortened))
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.secondarySystemBackground))
                )
            
            Button{
                vm.deleteNote(byIds: [note.id])
                dismiss()
            }label: {
                Text("SİL")
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.red))
            )
            
        }
        .padding()
        .navigationTitle("Detay")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    DetailView(note: Note(title: "sdaas", content: "sdaas", date: Date()),vm: NoteViewModel())
}
