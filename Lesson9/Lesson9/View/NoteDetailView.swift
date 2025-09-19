//
//  NoteDetailView.swift
//  Lesson9
//
//  Created by Batuhan Gözegü on 19.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    
    let note: Note
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var editedTitle: String = ""
    @State private var editedContent: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(spacing: 16){
            if isEditing{
                TextField("Title", text: $editedTitle)
                    .font(.title.bold())
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color(.systemGray6))
                    )
                
                TextEditor(text: $editedContent)
                    .font(.body)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color(.systemGray6))
                    )
                    .frame(minHeight: 200)
            }else {
                Text(note.title ?? "")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color(.systemGray6))
                    )
                
                ScrollView{
                    Text(note.content ?? "")
                        .font(.body)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 23)
                                .fill(Color(.systemGray6))
                        )
                }//scrolview
            }//else
            
            Text(note.date?.formatted(date:.long , time: .shortened) ?? "")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color(.systemGray6))
                )
            Spacer()
            
            if isEditing{
                HStack(spacing: 16) {
                    Button("İptal"){
                        cancelEditing()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color.gray)
                    )
                    .foregroundStyle(.white)
                    .font(.system(size:20, weight: .bold))
                    
                    Button("Kaydet"){
                        saveNote()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 23)
                            .fill(Color.blue)
                    )
                    .foregroundStyle(.white)
                    .font(.system(size:20, weight: .bold))
                }
            }else {
                Button("Düzenle"){
                    startEditing()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color.blue)
                )
                .foregroundStyle(.white)
                .font(.system(size:20, weight: .bold))
            }
        }//vstack
        .padding()
        .navigationTitle("Not Detayı")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button("Sil"){
                    deleteNote()
                }
                .foregroundStyle(.red)
            }
        }
        .onAppear{
            editedTitle = note.title ?? ""
            editedContent = note.content ?? ""
        }
    }
    
    private func startEditing(){
        editedTitle = note.title ?? ""
        editedContent = note.content ?? ""
        isEditing = true
    }
    
    private func cancelEditing(){
        editedTitle = note.title ?? ""
        editedContent = note.content ?? ""
        isEditing = false
    }
    
    private func saveNote(){
        withAnimation {
            note.title = editedTitle
            note.content = editedContent
            note.date = Date()
            
            
            do {
                try viewContext.save()
                isEditing = false
            }catch {
                print("Hata : \(error)")
            }
            
        }
    }
    
    private func deleteNote(){
        withAnimation {
            viewContext.delete(note)
        
            
            do{
                try viewContext.save()
                dismiss()
            }catch{
                print("Hata \(error)")
            }
            
        }
    }
    
}
